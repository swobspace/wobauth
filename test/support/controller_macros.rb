module Wobauth
  module TestControllerMacros
    def login_admin
      request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin      ||= users(:admin)
      @admin_role ||= roles(:admin)
      @admin_auth ||= Wobauth::Authority.create(:authorizable => @admin, :role => @admin_role)
      sign_in @admin
    end

    def login_user
      request.env["devise.mapping"] = Devise.mappings[:user]
      @user      ||= users(:dummy)
      sign_in @user
    end
  end
end
