class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def show
    @user_task = @user
    #@user = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        #UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Please confirm your email address to continue"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:danger] = "You have to create a valid username and password to continue"
        render 'new'
      end
    end

  def update
      if @user.update(current_user)
        redirect_to @user
      else
        render 'edit'
      end
    end

  def destroy
    if !@user.admin?
      @user.destroy
      redirect_to user_path, flash[:notice] = "You have logged out successfully!"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def same_user
    if current_user != @user and !current_user.admin?
      redirect_to user_path
    end
  end

    def require_admin
    if logged_in? && !current_user.admin?
      redirect_to root_path
    end
  end
end
