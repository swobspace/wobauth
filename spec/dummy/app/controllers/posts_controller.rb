class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_show, only: [:show]

  # GET /posts
  def index
    @posts = Post.all
    respond_with(@posts)
  end

  # GET /posts/1
  def show
    respond_with(@post)
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_with(@post)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    @post.save
    respond_with(@post)
  end

  # PATCH/PUT /posts/1
  def update
    @post.update(post_params)
    respond_with(@post)
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:subject, :message, :category_id)
    end
end
