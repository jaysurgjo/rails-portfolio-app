class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def show
    @user_task = @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(current_user)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
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
      redirect_to user_path
    end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      #params.permit(:username, :password)
      #params.permit(:user_id, :username, :password)
      params.require(:current_user).permit(:email, :username, :password, :user)
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
