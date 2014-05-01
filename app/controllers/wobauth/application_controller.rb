module Wobauth
  class ApplicationController < ActionController::Base
    # -- breadcrumbs
    include Wobapphelpers::Breadcrumbs
    before_filter :add_breadcrumb_index, only: [:index]

    # -- flash responder
    self.responder = Wobapphelpers::Responders
    respond_to :html, :json
  end
end
