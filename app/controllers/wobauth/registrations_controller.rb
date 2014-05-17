module Wobauth
  class RegistrationsController < Devise::RegistrationsController
   
    protected

    def after_sign_up_path_for(resource)
      main_app.root_path
    end

    def after_update_path_for(resource)
      main_app.root_path
    end
   
    def after_inactive_sign_up_path_for(resource)
      main_app.root_path
    end
   
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
   
    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end
end
