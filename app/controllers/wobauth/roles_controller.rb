require_dependency "wobauth/application_controller"

module Wobauth
  class RolesController < ApplicationController
    before_action :set_role, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /roles
    def index
      @roles = Role.all
      respond_with(@roles)
    end

    # GET /roles/1
    def show
      respond_with(@role)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def role_params
        params.require(:role).permit(:name)
      end
  end
end
