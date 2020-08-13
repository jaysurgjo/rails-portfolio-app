class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_task, only: [:show, :edit, :update, :destroy]
end

  def index
    @task = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
  end


  def update

  end


  def destroy
  end
