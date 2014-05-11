module Wobauth
  module ControllerMacros
    def login_admin
      request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin      ||= users(:admin)
      @admin_role ||= roles(:admin)
      @admin_auth ||= Wobauth::Authority.create(:authorizable => @admin, :role => @admin_role)
      sign_in @admin
    end
  end
end
