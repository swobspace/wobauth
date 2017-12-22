module Wobauth
  class Groups::AuthoritiesController < AuthoritiesController
    before_action :set_authorizable

  private

    def set_authorizable
      @authorizable = Group.find(params[:group_id])
    end
  end
end
