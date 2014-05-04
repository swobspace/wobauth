require_dependency "wobauth/application_controller"

module Wobauth
  class MembershipsController < ApplicationController
    before_action :set_membership, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /memberships
    def index
      @memberships = Membership.all
      respond_with(@memberships)
    end

    # GET /memberships/1
    def show
      respond_with(@membership)
    end

    # GET /memberships/new
    def new
      @membership = Membership.new
      respond_with(@membership)
    end

    # GET /memberships/1/edit
    def edit
    end

    # POST /memberships
    def create
      @membership = Membership.new(membership_params)

      @membership.save
      respond_with(@membership)
    end

    # PATCH/PUT /memberships/1
    def update
      @membership.update(membership_params)
      respond_with(@membership)
    end

    # DELETE /memberships/1
    def destroy
      @membership.destroy
      respond_with(@membership)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_membership
        @membership = Membership.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def membership_params
        params.require(:membership).permit(:user_id, :group_id)
      end
  end
end
