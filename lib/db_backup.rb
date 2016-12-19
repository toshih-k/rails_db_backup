module DbBackup
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/db_backup_tasks.rake'
    end
  end
end
