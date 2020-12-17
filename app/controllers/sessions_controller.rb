class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session])
      if user && user.authenticate(params[:email], params[:password])
      session[:user.id] = user_id
      redirect_to root_path
    else
      redirect_to new_task_path
    end
  end

  def destroy
    session.delete(:current_user)
    #@current_user = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end
