class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username]) #username
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_task_path
    else
      redirect_to login_path
      #redirect_to new_task_path
    end
  end

  def destroy
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
  end
end
