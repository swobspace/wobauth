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
      ActiveSupport.on_load :action_controller do
        helper Wobauth::ApplicationHelper
      end
    end

    config.to_prepare do
      Wobauth::ApplicationController.helper Rails.application.helpers
    end

  end
end
