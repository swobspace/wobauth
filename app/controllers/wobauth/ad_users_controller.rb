require_dependency "wobauth/application_controller"

module Wobauth
  class AdUsersController < ApplicationController
    def index
      if Wobauth.ldap_options.blank?
        flash[:error] = "LDAP options not set, can't proceed"
	@ad_users = []
      elsif search_params.present?
	result = SearchAdUserService.new(search_params.to_h).call
	unless result.success?
	  flash[:error] = result.error_messages.join(", ")
	end
	@ad_users = result.ad_users
      else
	@ad_users = []
      end
      respond_with(@ad_users)
    end

  private

    def search_params
      params.permit(:query, :utf8, :authenticity_token, :bci).slice(:query)
    end
  end
end
