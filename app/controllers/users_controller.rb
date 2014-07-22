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

  def show
    @user = User.find(current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user)

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

end
