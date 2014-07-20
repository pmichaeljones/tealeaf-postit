class SessionsController < ApplicationController

  def new

  end

  def create
    #binding.pry
    user = User.find_by_username(params[:username])

    #binding.pry

    if user.authenticate(params[:password])
      flash[:notice] = "Login Successful!"
      redirect_to root_path
    else
      flash[:error] = "Something is wrong with your username or password."
      render 'sessions/new'
    end



  end

end
