class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :same_user, only: [:edit, :update]


  def index
    @tasks = current_user.tasks
  end


  def show
    @task = current_user.tasks.find(params[:id])
    @users = User.all
  end

  def new
    @task = Task.new
  end


  def edit
  end


  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:success] = "You have created a task!"
      redirect_to tasks_path(@task)
    else
      render 'show'
    end
  end


  def update
    if @task.update(task_params)
      flash[:sucess] = "You have updated a task successfully!"
      redirect_to tasks_path(@task)
    else
      render 'edit'
    end
  end


  def destroy
    @task = current_user.tasks.find(params[:task_id])
    if @task.destroy
      flash[:success] = "deleted task"
      redirect_to tasks_path
    else
      flash[:danger] = "You don't have permission to delete this task"
      redirect_to tasks_path
    end
  end

  def assign
    @task_to_update = Task.find(params[:task_id])

    if @task_to_update.update(user_id: params[:user])
      flash[:sucess] = "You have assigned a task successfully!"
      redirect_to tasks_path(@task)
    else
      render 'show'
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :facts, :comments)
    end

    def same_user
      if current_user != @task.user and !current_user.admin?
        redirect_to task_path
      end
    end
end
