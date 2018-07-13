# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
# require 'capybara/rails'
# require 'mocha/test_unit'
require 'shoulda'
require 'devise'
require 'cancancan'
require 'sass-rails'
require 'coffee-rails'
require 'factory_bot_rails'
require 'rails-controller-testing'
Rails::Controller::Testing.install

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
# if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures/wobauth", __FILE__)
# end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  if defined?(::Capybara::DSL)
    include Capybara::DSL
  end
end

# For generators
require "rails/generators/test_case"
require "generators/wobauth/install_generator"

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
  include Wobauth::ControllerMacros
end

class MiniTest::Unit::TestCase
  include FactoryBot::Syntax::Methods
end
