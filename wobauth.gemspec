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
  s.summary     = "Rails engine providing MVCs for Group, Role, Membership and Authority"
  s.description = "Rails engine providing MVCs for Group, Role, Membership and Authority"
  s.license     = "GPLv2"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "wobapphelpers"
  s.add_dependency "simple_form"
  s.add_dependency "devise"
  s.add_dependency "cancancan", "~> 1.7.0"
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails', '~> 4.0.3'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency "bootstrap-sass", "~> 3.1.1"
  # s.add_development_dependency "capybara"
  s.add_development_dependency "shoulda"
  # s.add_development_dependency "mocha"
  s.add_development_dependency "devise"
  s.add_development_dependency "factory_girl_rails"

end
