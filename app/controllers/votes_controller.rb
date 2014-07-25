class VotesController < ApplicationController
  before_action :require_user
  respond_to :html, :js

  def create
    #binding.pry

    @post = Post.find(params[:id])

    #binding.pry

    respond_to do |format|

      format.html do
        if Vote.where(voteable:@post, user_id:current_user.id).empty?
          @vote = Vote.create(vote: params[:vote], voteable: @post, user_id: current_user.id)
          redirect_to :back
        else
          flash[:error] = "You already voted on that."
          redirect_to :back
        end
      end

      format.js do
      end

    end


  end

  def comment_vote
    #binding.pry

    respond_to do |format|
      format.html do
        if Vote.where(voteable:Comment.find(params[:id]), user_id:current_user.id).empty?
          @vote = Vote.create(vote: params[:vote], voteable: Comment.find(params[:id]), user_id: current_user.id)
          redirect_to :back
        else
          flash[:error] = "You already voted on that."
          redirect_to :back
        end
      end

      format.js do
        # if Vote.where(voteable:Comment.find(params[:id]), user_id:current_user.id).empty?
        #   @vote = Vote.create(vote: params[:vote], voteable: Comment.find(params[:id]), user_id: current_user.id)
        # else
        #   redirect_to :back
        # end

      end
    end


  end


  private

end
