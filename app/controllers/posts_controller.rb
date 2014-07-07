class PostsController < ActionController::Base

  def index
    @posts = Post.all
    render :index, layout: "application"
  end

  def show
    @post = Post.find(params[:id])
    render layout: "application"
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


end
