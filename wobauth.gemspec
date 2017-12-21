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

  s.files = Dir["{app,config,db,lib}/**/*", "test/factories.rb", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "wobapphelpers"
  s.add_dependency "wobaduser"
  s.add_dependency 'immutable-struct'
  s.add_dependency "simple_form"
  s.add_dependency "devise"
  s.add_dependency "cancancan"
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'record_tag_helper', '~> 1.0'

  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency "shoulda-context"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "devise"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency 'simple_form'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'dotenv'
end
