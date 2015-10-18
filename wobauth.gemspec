$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wobauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wobauth"
  s.version     = Wobauth::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.require_paths = ["lib"]
  s.authors     = ["Wolfgang Barth"]
  s.email       = ["wob@swobspace.de"]
  s.homepage    = "http://github.com/swobspace/wobauth"
  s.summary     = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.description = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "test/factories/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", "~> 4.1"
  s.add_runtime_dependency "wobapphelpers"
  s.add_runtime_dependency "simple_form"
  s.add_runtime_dependency "devise"
  s.add_runtime_dependency "cancancan", "~> 1.9"
  s.add_runtime_dependency 'sass-rails'
  s.add_runtime_dependency 'coffee-rails'

  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency "bootstrap-sass"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "devise"
  s.add_development_dependency "factory_girl_rails"

end
