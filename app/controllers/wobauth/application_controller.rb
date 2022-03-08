module Wobauth
  class ApplicationController < ActionController::Base
    # -- use the application default layout
    layout "application"

    # -- devise
    before_action :authenticate_user!, :unless => :devise_controller?
    # -- cancan
    load_and_authorize_resource unless: :devise_controller?

    # -- breadcrumbs
    include Wobapphelpers::Breadcrumbs
    before_action :add_breadcrumb_index, only: [:index]

    # -- flash responder
    self.responder = Wobapphelpers::Responders
    respond_to :html, :json


    # -- cancan ability for wobauth
    def current_ability
      @current_ability ||= Wobauth::AdminAbility.new(current_user)
    end

    # ensure 303 redirect on non get requests
    def redirect_to(url_options = {}, response_options = {})
      response_options[:status] ||= :see_other unless request.get?
      super url_options, response_options
    end
  end
end
