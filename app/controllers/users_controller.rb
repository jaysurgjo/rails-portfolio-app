class UsersController < TasksController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  
  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
  end


  def update

  end


  def destroy

  end

  private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:name, :facts)
    end
end
