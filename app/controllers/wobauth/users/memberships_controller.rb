module Wobauth
  class Users::MembershipsController < MembershipsController
    before_action :set_membershipable

  private

    def set_membershipable
      @membershipable = User.find(params[:user_id])
    end
  end
end
