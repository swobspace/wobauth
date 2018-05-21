module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types, group_method = :all)
      if types.any?
        # -- type selection
	msg = ""
	msg += form.input("#{poly}_type".to_sym, collection: types,
                 label_method: lambda {|x| t('activerecord.models.' + x.underscore)}
               )
        # -- object id selection
        collections = types.map {|t| t.constantize}
        msg += form.input(
                 "#{poly}_id".to_sym, collection: collections,
                 as: :grouped_select, group_method: group_method
               )
	msg.html_safe
      end
    end

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
