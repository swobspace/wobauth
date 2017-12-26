module Wobauth
  class Groups::MembershipsController < MembershipsController
    before_action :set_membershipable

  private

    def set_membershipable
      @membershipable = Group.find(params[:group_id])
    end
  end
end
