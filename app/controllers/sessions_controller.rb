class SessionsController < ApplicationController
  @show_error = false 
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      @show_error = true
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path, notice: "Logged out!"
  end
end
