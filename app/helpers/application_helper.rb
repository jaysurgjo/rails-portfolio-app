module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.current = @user
  end
end
