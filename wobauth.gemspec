$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wobauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wobauth"
  s.version     = Wobauth::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.author     = "Wolfgang Barth"
  s.email       = "wob@swobspace.de"
  s.homepage    = "http://github.com/swobspace/wobauth"
  s.summary     = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.description = "Rails engine providing MVCs for User, Group, Role, Membership and Authority"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "spec/factories.rb", "LICENSE", "Rakefile", "README.md"]

  s.add_runtime_dependency "rails", ">= 6.1"
  s.add_runtime_dependency "wobaduser", "~> 1.0"
  s.add_runtime_dependency 'immutable-struct'
  s.add_runtime_dependency "wobapphelpers", ">= 6.00"
  s.add_runtime_dependency "simple_form"
  s.add_runtime_dependency "devise"
  s.add_runtime_dependency "cancancan"
  s.add_runtime_dependency "responders"
  s.add_dependency "stimulus-rails"
  s.add_runtime_dependency "view_component"
  s.add_development_dependency "view_component"

  s.add_development_dependency "wobapphelpers", ">= 6.00"
  s.add_development_dependency "simple_form"
  s.add_development_dependency "devise"
  s.add_development_dependency "cancancan"
  s.add_development_dependency 'immutable-struct'
  # s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3", '~> 1.7'
  s.add_development_dependency "shoulda-context"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_bot"
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails', '>= 6.0.0'
  s.add_development_dependency 'dotenv-rails'
  s.add_development_dependency 'web-console'
  s.add_development_dependency "guard"
  # s.add_development_dependency "guard-minitest"
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'sprockets-rails'
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency 'turbo-rails'
  s.add_development_dependency 'jsbundling-rails'
  s.add_development_dependency 'cssbundling-rails'

end
