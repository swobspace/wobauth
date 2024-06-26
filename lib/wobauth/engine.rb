require 'devise'
require 'view_component'
module Wobauth
  class Engine < ::Rails::Engine
    isolate_namespace Wobauth

    config.generators do |g|
      g.templates.unshift File::expand_path('../../templates', __FILE__)
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end

    config.eager_load_paths += Dir["#{config.root}/lib/concerns"]

    # initializer "wobauth.assets.precompile" do |app|
    # end

    initializer 'wobauth.action_controller' do |app|
      ActiveSupport.on_load(:action_controller_base) do
        helper Wobauth::ApplicationHelper
      end
    end

    config.to_prepare do
      Wobauth::ApplicationController.helper Rails.application.helpers
    end

    initializer "wobauth.factories", :after => "factory_bot.set_factory_paths" do
      FactoryBot.definition_file_paths << File.expand_path('../../../spec/factories', __FILE__) if defined?(FactoryBot)
    end

  end
end
