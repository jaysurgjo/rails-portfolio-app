class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @task = @user.tasks.find(current_user)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(current_user)
      if @user.save
        redirect_to task_path(@user)
      else
        render 'show'
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
      params.require(:current_user).permit(:username, :password, :user)
    end
