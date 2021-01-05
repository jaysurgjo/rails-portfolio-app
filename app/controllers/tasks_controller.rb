class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :same_user, only: [:edit, :update]


  def index
    @tasks = Task.all
  end


  def show
    @task = current_user.tasks.find(params[:id])
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
    redirect_to tasks_path(@task)
  else
    render 'show'
  end
end


  def update
    if @task.update(task_params)
    redirect_to tasks_path(@task)
  else
    render 'edit'
  end
end


  def destroy
    @task = current_user.tasks.find(params[:task_id])
    if @task.destroy
      redirect_to tasks_path, notice: "Task deleted successfully"
    else
      redirect_to tasks_path, notice: "You don't have permission to delete this task"
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
