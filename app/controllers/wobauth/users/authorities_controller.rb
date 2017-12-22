module Wobauth
  class Users::AuthoritiesController < AuthoritiesController
    before_action :set_authorizable

  private

    def set_authorizable
      @authorizable = User.find(params[:user_id])
    end
  end
end
