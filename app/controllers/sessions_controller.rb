class SessionsController < ApplicationController
  before_action :set_sessions, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

private

#def find_by_email
#end
