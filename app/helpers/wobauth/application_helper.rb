module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types, group_method = :all)
      msg = ""
      # -- object available?
      if form.object.send(poly).present?
	msg += poly_type_display(form, poly)
	msg += poly_id_select(form, poly, form.object.send("#{poly}_type"), :all)
      else
	msg += poly_type_select(form, poly, types)
	msg += poly_id_select(form, poly, types, group_method)
      end
      msg.html_safe
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

  private

    def poly_type_select(f, poly, types)
      f.input "#{poly}_type".to_sym, collection: types,
              label_method: lambda {|x| t('activerecord.models.' + x.underscore)}
    end

    def poly_type_display(f, poly)
     f.input("#{poly}_type".to_sym, collection: Array(f.object.send("#{poly}_type")),
       label_method: lambda {|x| t('activerecord.models.' + x.underscore)},
       disabled: true) +
     f.hidden_field("#{poly}_type".to_sym, value: f.object.send("#{poly}_type"))
    end

    def poly_id_select(f, poly, types, group_method)
      collections = Array(types).map {|t| t.constantize}
      f.input "#{poly}_id".to_sym, collection: collections,
                 as: :grouped_select, group_method: group_method
    end

  end
end
