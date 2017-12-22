# -*- encoding : utf-8 -*-
module RequestMacros
  include Warden::Test::Helpers
  Warden.test_mode!

  # for use in request specs
  def login_user(options = {})
    options.symbolize_keys!
    ou = options.fetch(:org_unit, nil)
    role = options.fetch(:role, false)
    user = FactoryBot.create(:user)
    if role
      user_role = Wobauth::Role.find_or_create_by(name: role)
      FactoryBot.create(:authority, authorizable: user, 
                         role: user_role, authorized_for: ou)
    end
    login_as(user, scope: :user)
  end

  # for use in request specs
  def login_admin
    @admin      = FactoryBot.create(:user)
    @admin_role = FactoryBot.create(:role, name: 'Admin')
    FactoryBot.create(:authority, :authorizable => @admin, :role => @admin_role)
    login_as @admin
  end
end
