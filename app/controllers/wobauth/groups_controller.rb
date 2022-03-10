require_dependency "wobauth/application_controller"

module Wobauth
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /groups
    def index
      @groups = Group.all
      respond_with(@groups)
    end

    def tokens
      @groups = Group.all
      respond_with(@groups) do |format|
        format.turbo_stream
      end
    end

    # GET /groups/1
    def show
      respond_with(@group)
    end

    # GET /groups/new
    def new
      @group = Group.new
      respond_with(@group)
    end

    # GET /groups/1/edit
    def edit
    end

    # POST /groups
    def create
      @group = Group.new(group_params)

      @group.save
      respond_with(@group)
    end

    # PATCH/PUT /groups/1
    def update
      @group.update(group_params)
      respond_with(@group)
    end

    # DELETE /groups/1
    def destroy
      @group.destroy
      respond_with(@group)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def group_params
        params.require(:group).permit(:name, :description)
      end
  end
end
