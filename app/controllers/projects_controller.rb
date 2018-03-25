class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show update edit destroy]
  before_action :authorize, except: %i[show index]

  def index
    @projects = Project.order('created_at DESC').page(params[:page]).per(5)
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was succesfull created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was succesfull updated'
    else
      render :edit
    end
  end

  def destroy
    @project.delete
    redirect_to projects_path, notice: 'Project was succesfull deleted'
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end
end
