require 'devise'
module Wobauth
  class Engine < ::Rails::Engine
    isolate_namespace Wobauth

    config.generators do |g|
      g.templates.unshift File::expand_path('../../templates', __FILE__)
    end

    config.eager_load_paths += Dir["#{config.root}/lib/concerns"]

    initializer "wobauth.assets.precompile" do |app|
      app.config.assets.precompile += %w(wobauth/authorities.js)
    end

    initializer 'wobauth.action_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        ::ActionController::Base.helper Wobauth::ApplicationHelper
      end
    end

    config.to_prepare do
      Wobauth::ApplicationController.helper Rails.application.helpers
    end

    initializer "wobauth.factories", :after => "factory_girl.set_factory_paths" do
      FactoryGirl.definition_file_paths << File.expand_path('../../../test/factories', __FILE__) if defined?(FactoryGirl)
    end

  end
end
