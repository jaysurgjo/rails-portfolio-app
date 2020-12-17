class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show, :like]
  before_action :same_user, only: [:edit, :update, :destroy]


  def index
    @tasks = Task.all
  end


  def show
    @task = @user.tasks.find(current_user)
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
    Task.find(params[:id]).destroy
    #@task.destroy
    redirect_to show_task_path
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :facts [])
  end

  def same_user
      if current_user != @task.user and !current_user.admin?
        redirect_to task_path
      end
    end
end
