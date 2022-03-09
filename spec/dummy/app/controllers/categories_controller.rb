class CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_show, only: [:show]

  # GET /categories
  def index
    @categories = Category.all
    respond_with(@categories) do |format|
      format.turbo_stream
    end
  end

  # GET /categories/1
  def show
    respond_with(@category)
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    @category.save
    respond_with(@category)
  end

  # PATCH/PUT /categories/1
  def update
    @category.update(category_params)
    respond_with(@category)
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name)
    end
end
