require_dependency "wobauth/application_controller"

module Wobauth
  class LoginController < ApplicationController
    skip_load_and_authorize_resource
    def login
      redirect_to main_app.root_path
    end
  end
end
