class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(current_user)
      if user && user.authenticate(params[:username], params[:password])
      session[:user.id] = user_id
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    session.delete(:current_user)
    @current_user = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
