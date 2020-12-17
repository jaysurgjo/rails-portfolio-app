class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    #if session[:username]
      #@current_user ||= User.find_by(id: session[:username])
    #else
      #@current_user = nil
    #end
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      redirect_to root_path
    end
  end
end
