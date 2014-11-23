$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wobauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wobauth"
  s.version     = Wobauth::VERSION
  s.authors     = ["Wolfgang Barth"]
  s.email       = ["wob@swobspace.de"]
  s.homepage    = "http://github.com/swobspace/wobauth"
  s.summary     = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.description = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "test/factories/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "wobapphelpers"
  s.add_dependency "simple_form"
  s.add_dependency "devise"
  s.add_dependency "cancancan", "~> 1.7"
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency "bootstrap-sass"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "devise"
  s.add_development_dependency "factory_girl_rails"

end
