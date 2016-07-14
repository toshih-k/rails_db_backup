$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "db_dump/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_dump"
  s.version     = DbDump::VERSION
  s.authors     = ["Toshihisa KATO"]
  s.email       = ["toshih-k@kogakusha.co.jp"]
  s.homepage    = "http://git.ict.kogakusha.co.jp/"
  s.summary     = "Dump Database."
  s.description = "Dump Database by using each RDBMS's specific dump command"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "mysql2"
end
