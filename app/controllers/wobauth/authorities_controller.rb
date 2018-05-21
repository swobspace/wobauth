require_dependency "wobauth/application_controller"

module Wobauth
  class AuthoritiesController < ApplicationController
    skip_load_and_authorize_resource
    load_and_authorize_resource class: Wobauth::Authority

    before_action :set_authority, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /authorities
    def index
      @authorities = Authority.accessible_by(current_ability, :read)
      respond_with(@authorities)
    end

    # GET /authorities/1
    def show
      respond_with(@authority)
    end

    # GET /authorities/new
    def new
      if @authorizable.present?
        @authority = @authorizable.authorities.new(authorized_for_params)
      else
        @authority = Authority.new(authorized_for_params)
      end
      respond_with(@authority)
    end

    # GET /authorities/1/edit
    def edit
    end

    # POST /authorities
    def create
      myparams = authorized_for_params.merge(authority_params)
      if @authorizable.present?
        @authority = @authorizable.authorities.new(myparams)
      else
        @authority = Authority.new(myparams)
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

      def authorized_for_params
        { 
          authorized_for_id: @authorized_for&.id, 
          authorized_for_type: @authorized_for&.model_name
        }
      end

    # if @authorizable exist: authorizable/authorizable_id#authority
    # else authority/authority_id
    #
    def location
      polymorphic_path(
        (@authorizable || @authorized_for || @authority), 
        anchor: ('authorities' if @authorizable || @authorized_for))
    end
  end
end
