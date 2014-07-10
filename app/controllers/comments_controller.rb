class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.creator = User.first

    @post.comments << @comment

    render 'posts/show'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
