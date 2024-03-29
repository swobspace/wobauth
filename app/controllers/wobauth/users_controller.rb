require_dependency "wobauth/application_controller"

module Wobauth
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /users
    def index
      @users = User.all
      respond_with(@users)
    end

    def tokens
      @users = User.all
      respond_with(@users) do |format|
        format.turbo_stream
      end
    end

    # GET /users/1
    def show
      respond_with(@user)
    end

    # GET /users/new
    def new
      @user = User.new(new_user_params)
      respond_with(@user)
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = User.new(user_params)

      @user.save
      respond_with(@user)
    end

    # PATCH/PUT /users/1
    def update
      @user.update(user_params)
      respond_with(@user)
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      respond_with(@user)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        if params[:user][:password].blank? && action_name == 'update'
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
        params.require(:user).permit(
          :username, :gruppen, :sn, :givenname, :displayname, 
          :telephone, :email, :password, :password_confirmation,
          :title, :position, :department, :company
         )
      end

      def new_user_params
        params.slice(
          :username, :gruppen, :sn, :givenname, :displayname, 
          :telephone, :email, :password, :password_confirmation,
          :title, :position, :department, :company
        ).permit!
      end
  end
end
