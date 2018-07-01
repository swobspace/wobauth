module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types, group_method = :all)
      if types.any?
        # -- type selection
	msg = ""
	msg += form.input "#{poly}_type".to_sym, 
                 collection: types.map { |t| 
                   [
                     t('activerecord.models.' + t.underscore),
                     t,
                     { data: { url: data_url(t) } }
                   ]
                 }
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

    def data_url(t)
      if String(t)&.constantize.respond_to?(:data_url)
        String(t)&.constantize.data_url
      else
	raise RuntimeError, <<-EOF
  Please implement class method ::data_url for #{t} (new since wobauth 4.0)
  See https://github.com/swobspace/wobauth for more information
  EOF
      end
    end
  end
end
