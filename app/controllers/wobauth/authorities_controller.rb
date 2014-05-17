require_dependency "wobauth/application_controller"

module Wobauth
  class AuthoritiesController < ApplicationController
    before_action :set_authority, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /authorities
    def index
      @authorities = Authority.all
      respond_with(@authorities)
    end

    # GET /authorities/1
    def show
      respond_with(@authority)
    end

    # GET /authorities/new
    def new
      @authority = Authority.new(new_authority_params)
      respond_with(@authority)
    end

    # GET /authorities/1/edit
    def edit
    end

    # POST /authorities
    def create
      @authority = Authority.new(authority_params)

      @authority.save
      respond_with(@authority)
    end

    # PATCH/PUT /authorities/1
    def update
      @authority.update(authority_params)
      respond_with(@authority)
    end

    # DELETE /authorities/1
    def destroy
      @authority.destroy
      respond_with(@authority)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_authority
        @authority = Authority.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def authority_params
        params.require(:authority).permit(:authorizable_id, :authorizable_type, :role_id, :authorized_for_id, :authorized_for_type, :valid_from, :valid_until)
      end

      def new_authority_params
        if params[:user_id]
          { authorizable_type: 'Wobauth::User', authorizable_id: params[:user_id] }
        elsif params[:group_id]
          { authorizable_type: 'Wobauth::Group', authorizable_id: params[:group_id] }
        end
      end
  end
end
