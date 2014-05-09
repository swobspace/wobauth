module Wobauth
  class ApplicationController < ActionController::Base
    # -- use the application default layout
    layout "application"

    # -- breadcrumbs
    include Wobapphelpers::Breadcrumbs
    before_filter :add_breadcrumb_index, only: [:index]

    # -- flash responder
    self.responder = Wobapphelpers::Responders
    respond_to :html, :json

    # -- cancan
    load_and_authorize_resource unless: :devise_controller?

    def current_ability
      @current_ability ||= Wobauth::Ability.new(current_user)
    end
  end
end
