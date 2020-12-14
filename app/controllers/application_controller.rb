class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:username]
      @current_user ||= User.find_by(id: session[:username])
    else
      @current_user = nil
    end
  end
end
