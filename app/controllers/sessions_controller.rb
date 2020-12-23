class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]) #username
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_task_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:current_user)
    session[:user_id] = nil
    redirect_to root_path
  end
end
