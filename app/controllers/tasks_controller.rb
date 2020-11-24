class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end


  def show
  end


  def new
    @task = Task.new
  end


  def edit
  end


  def create
    @task = Task.create(task_params)
  if @task.save
    redirect_to task_path(@task)
  else
    redirect_to task_path(@task)
  end
end


  def update
    if @task.update(task_params)
    redirect_to task_path(@task)
  else
    render :edit
  end
end


  def destroy
    @task.destroy
    redirect_to new_task_path, :notice => "Your task has been deleted"
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.permit(:task)
  end
end
