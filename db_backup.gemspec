$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "db_backup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_backup"
  s.version     = DbBackup::VERSION
  s.authors     = ["Toshihisa KATO"]
  s.email       = ["toshihk@gmail.com"]
  s.homepage    = "https://github.com/toshih-k/rails_db_backup"
  s.summary     = "Backup Database Task for Rails."
  s.description = "Dump Database by using each RDBMS's specific dump command"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 4.2"

  s.add_development_dependency "mysql2"
end
