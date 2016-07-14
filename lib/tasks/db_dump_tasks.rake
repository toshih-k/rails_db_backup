# desc "Explaining what the task does"
# task :db_dump do
#   # Task goes here
# end
namespace :db do
  namespace :data do

    def backup_dir
      if Rails.application.config.respond_to? :db_dump_dir
        Rails.application.config.db_dump_dir
      else
        Rails.root.join('db', 'data', 'backup')
      end
    end

    def backuplist
      Dir.glob(backup_dir.join('*.sql.dump')).sort
    end

    desc "dump database data"
    task :dump, ['date']=> :environment do |task, args|
      logger = Rails.logger

      logger.info "start database dump"
      config = ActiveRecord::Base.connection_config
      database_name = config[:database]
      filename = "#{config[:database]}_#{Time.now.strftime("%Y%m%d%H%M")}.sql.dump"
      fullpath = File.join(backup_dir, filename)
      options = {
        "user"=>config[:username],
        "password"=>config[:password],
        "result-file"=>fullpath
      }.select{|k, v| !v.nil? }.map{|k, v| "--#{k}=#{v}"}.join(" ")

      FileUtils.mkdir_p(File.dirname(fullpath)) unless FileTest.exist?(File.dirname(fullpath))
      unless FileTest.writable?(fullpath)
        logger.error("can't write file [#{fullpath}]")
      end

      sh "mysqldump #{options} #{database_name}"

      logger.info "end database dump"
    end

    desc "restore database data from dump"
    task :restore do |task, args|
      config = ActiveRecord::Base.connection_config
      database_name = config[:database]
      options = {
        "user"=>config[:username],
        "password"=>config[:password]
      }.select{|k, v| !v.nil? }.map{|k, v| "--#{k}=#{v}"}.join(" ")

      sh "mysql #{options} #{database_name} < #{backuplist.last}"
    end

    desc "list dumped database data"
    task :list do |task, args|
      backuplist.each do |item|
        puts item
      end
    end
  end

end
