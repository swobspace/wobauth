require_dependency "wobauth/application_controller"

module Wobauth
  class MembershipsController < ApplicationController
    skip_load_and_authorize_resource
    load_and_authorize_resource class: Wobauth::Authority

    before_action :set_membership, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /memberships
    def index
      respond_with(@memberships)
    end

    # GET /memberships/1
    def show
      respond_with(@membership)
    end

    # GET /memberships/new
    def new
      if @membershipable.present?
        @membership = @membershipable.memberships.new
      else
        @membership = Membership.new
      end
      respond_with(@membership)
    end

    # GET /memberships/1/edit
    def edit
    end

    # POST /memberships
    def create
      if @membershipable.present?
        @membership = @membershipable.memberships.new(membership_params)
      else
        @membership = Membership.new(membership_params)
      end

      @membership.save
      respond_with(@membership, location: location)
    end

    # PATCH/PUT /memberships/1
    def update
      @membership.update(membership_params)
      respond_with(@membership, location: location)
    end

    # DELETE /memberships/1
    def destroy
      @membership.destroy
      respond_with(@membership, location: location)
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

    # if @membershipable exist: membershipable/membershipable_id#authority
    # else authority/authority_id
    #
    def location
      polymorphic_path((@membershipable || @membership), anchor: ('memberships' if @membershipable))
    end

  end
end
