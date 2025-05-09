module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All
    # use temporary copy for develop
    # include Wobapphelpers::Helpers::PolymorphicHelper

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

    def group_link(dn)
      shortdn = dn.split(/,*..=/)[1]
      link_to shortdn, ad_users_path(query: "all:group:#{dn}"),
                  class: 'primary-link',
                  data: { "turbo-prefetch" => "false" }
    end
  end
end
