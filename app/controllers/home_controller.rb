class HomeController < ApplicationController
  def index
    #redirect_to recipes_path if logged_in?
    #render :file => 'home/index.html' and return
    respond_to do |format|
    format.html
  end
end
end
