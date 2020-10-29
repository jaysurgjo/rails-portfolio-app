class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :Update, :destroy]


  def index
    @tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end


  def edit
    @task = Task.find(params[:id])
  end


  def create
    @task = Task.create(task_params)
  if @task.save
    redirect_to task_path(@task)
  else
    render 'new'
  end
end


  def update
    if @task.update
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end


  def destroy
    Task.find(params[:id]).destroy
    redirect_to task_path
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name,)
  end
end
