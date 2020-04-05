module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All
    include Wobapphelpers::Helpers::PolymorphicHelper

    def navigation_admin_links
      render partial: 'wobauth/shared/admin'
    end

    def navigation_account_links
      render partial: 'wobauth/shared/accounting'
    end

    def admin_active_class
      if [:users, :groups, :memberships, :roles, :authorities].include?(controller.controller_name.to_sym)
        "active"
      end
    end

  end
end
