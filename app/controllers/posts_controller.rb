class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was saved successfully."
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "The Post was Edited Successfully."
      redirect_to posts_path
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end



end
