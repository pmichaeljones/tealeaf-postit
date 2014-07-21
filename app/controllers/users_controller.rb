class UsersController < ApplicationController

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

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
