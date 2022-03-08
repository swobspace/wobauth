class ApplicationController < ActionController::Base
  # -- breadcrumbs
  include Wobapphelpers::Breadcrumbs
  before_action :add_breadcrumb_index, only: [:index]
 
  # -- flash responder
  self.responder = Wobapphelpers::Responders
  respond_to :html, :json

  # -- Wobauth helpers will be included from engine

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ensure 303 redirect on non get requests
  def redirect_to(url_options = {}, response_options = {})
    response_options[:status] ||= :see_other unless request.get?
    super url_options, response_options
  end
end
