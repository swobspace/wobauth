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
    before_action :add_breadcrumb_index,
                  :if => proc {|c| !devise_controller? && c.action_name == 'index' }

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

    # redirect to root_path on authorization errors
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to main_app.root_path, alert: exception.message }
      end
    end
  end
end
