class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(user_params)
      if @user.save
        redirect_to @user
      else
        render :new
      end
    end
  end

  def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit_user_path
      end
    end

  def destroy
    @user.destroy
      redirect_to users_path
    end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {})
    end
