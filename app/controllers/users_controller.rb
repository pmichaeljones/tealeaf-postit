class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry

    if @user.save
      flash[:notice] = "Registration Successful."
      session[:user_id] = @user.id
      redirect_to login_path
    else
      flash[:notice] = "There was a problem with registration."
      render '/users/new'
    end

  end

  def show
    #binding.pry
    @user = User.find_by slug: params[:id]
  end

  def edit
    #binding.pry
    @user = User.find_by slug: params[:id]
  end

  def update
    @user = User.find_by slug: params[:id]
    if @user.update(user_params)
      flash[:notice] = "Your Profile was Edited Successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password)
  end

  def require_same_user
    @user = User.find_by slug: params[:id]
    if current_user != @user
      flash[:error] = "Sorry, can't do that."
      redirect_to user_path
    end

  end


end
