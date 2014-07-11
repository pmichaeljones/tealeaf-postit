class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comment.creator = User.first
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    #binding.pry
    #@categories = Category.all
    @post = Post.new(post_params)
    @post.category_ids = params[:category_id].keys
    @post.creator = User.first #change once we have authentication

    if @post.save
      flash[:notice] = "Post was saved successfully."
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
    @categories = Category.all
  end

  def update
    @post.category_ids = params[:category_id].keys

    if @post.update(post_params)
      flash[:notice] = "The Post was Edited Successfully."
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
