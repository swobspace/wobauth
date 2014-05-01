module Wobauth
  class Engine < ::Rails::Engine
    isolate_namespace Wobauth

    config.generators do |g|
      g.templates.unshift File::expand_path('../../templates', __FILE__)
    end
  end
end
