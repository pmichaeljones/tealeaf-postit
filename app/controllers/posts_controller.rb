class PostsController < ActionController::Base

  def index
    @posts = Post.all
    render :index, layout: "application"
  end

  def show
    @post = Post.find[params[:id]]
  end

end
