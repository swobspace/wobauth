class ApplicationController < ActionController::Base
  # -- breadcrumbs
  include Wobapphelpers::Breadcrumbs
  before_action :add_breadcrumb_index, only: [:index]
 
  # -- flash responder
  self.responder = Wobapphelpers::Responders
  respond_to :html, :json

  # -- Wobauth helpers
  helper Wobauth::ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
