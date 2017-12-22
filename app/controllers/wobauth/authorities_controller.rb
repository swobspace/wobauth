require_dependency "wobauth/application_controller"

module Wobauth
  class AuthoritiesController < ApplicationController
    skip_load_and_authorize_resource
    load_and_authorize_resource class: Wobauth::Authority

    before_action :set_authority, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /authorities
    def index
      respond_with(@authorities)
    end

    # GET /authorities/1
    def show
      respond_with(@authority)
    end

    # GET /authorities/new
    def new
      if @authorizable.present?
        @authority = @authorizable.authorities.new
      else
        @authority = Authority.new
      end
      respond_with(@authority)
    end

    # GET /authorities/1/edit
    def edit
    end

    # POST /authorities
    def create
      if @authorizable.present?
        @authority = @authorizable.authorities.new(authority_params)
      else
        @authority = Authority.new(authority_params)
      end

      @authority.save
      respond_with(@authority, location: location)
    end

    # PATCH/PUT /authorities/1
    def update
      @authority.update(authority_params)
      respond_with(@authority, location: location)
    end

    # DELETE /authorities/1
    def destroy
      @authority.destroy
      respond_with(@authority, location: location)
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

    # if @authorizable exist: authorizable/authorizable_id#authority
    # else authority/authority_id
    #
    def location
      polymorphic_path((@authorizable || @authority), anchor: ('authorities' if @authorizable))
    end
  end
end
