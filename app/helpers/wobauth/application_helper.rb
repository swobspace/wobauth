module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types)
      if types.any?
	msg = ""
	msg += form.input("#{poly}_type".to_sym, collection: types)
	# types.each do |type|
	#   msg += form.input("#{poly}_id".to_sym, collection: type.constantize.all,
  	# 	   label: t("activerecord.models." + type.underscore))
	# end
        collections = types.map {|t| t.constantize}
        msg += form.input(
                 "#{poly}_id".to_sym, collection: collections,
                 as: :grouped_select, group_method: :all
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
