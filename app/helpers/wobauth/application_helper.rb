module Wobauth
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types)
      if types.any?
	msg = ""
	msg += form.input("#{poly}_type".to_sym, collection: types)
	types.each do |type|
	  msg += form.input("#{poly}_id".to_sym, collection: type.constantize.all,
		   label: t("activerecord.models." + type.underscore))
	end
	msg.html_safe
      end
    end
  end
end
