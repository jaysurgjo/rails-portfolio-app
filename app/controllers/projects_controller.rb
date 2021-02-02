class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:success] = "You have created a new project!"
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
      if @project.update(project_params)
        flash[:sucess] = "You have updated a project successfully!"
        redirect_to projects_path(@project)
      else
        render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:sucess] = "You have deleted a Project!"
      redirect_to projects_path
    else
      flash[:danger] = "You can't delete this task!"
      redirect_to projects_path
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :user_id)
    end
end
