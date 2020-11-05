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
    render 'new'
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
