class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]

  def index
    @posts = Post.all.sort_by {|x| x.total_votes }.reverse

  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = Post.new(post_params)
    #binding.pry

    @post.creator = current_user #change once we have authentication
    #binding.pry
    if @post.save
      flash[:notice] = "Post was saved successfully."
      redirect_to posts_path
    else
      #binding.pry
      render :new
    end

  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "The Post was Edited Successfully."
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find_by slug: params[:id]
  end


end
