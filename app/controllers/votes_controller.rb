class VotesController < ApplicationController
  before_action :require_user

  def create
    #binding.pry

    @post = Post.find_by slug: params[:id]
    @vote = Vote.new(vote: params[:vote], voteable: @post, user_id: current_user.id)
    #binding.pry

    respond_to do |format|

      format.html do
        if @vote.valid?
          @vote.save
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

    @comment = Comment.find(params[:id])
    #binding.pry
    @vote = Vote.new(vote: params[:vote], voteable: @comment, user_id: current_user.id)
    #binding.pry
    respond_to do |format|
      format.html do
        if @vote.valid?
          @vote.save
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


  private

end
