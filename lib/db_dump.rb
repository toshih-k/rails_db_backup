module DbDump
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/db_dump_tasks.rake'
    end
  end
end
