class VotesController < ApplicationController
  before_action :require_user

  def create
    #binding.pry

    if Vote.where(voteable:Post.find(params[:id]), user_id:current_user.id).empty?
      @vote = Vote.create(vote: params[:vote], voteable: Post.find(params[:id]), user_id: current_user.id)
      redirect_to :back
    else
      flash[:error] = "You already voted on that."
      redirect_to :back
    end

  end

  def comment_vote
    #binding.pry

    if Vote.where(voteable:Comment.find(params[:id]), user_id:current_user.id).empty?
      @vote = Vote.create(vote: params[:vote], voteable: Comment.find(params[:id]), user_id: current_user.id)
      redirect_to :back
    else
      flash[:error] = "You already voted on that."
      redirect_to :back
    end

  end


  private

end
