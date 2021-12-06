class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all.paginate(page: params[:page])
    
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project=Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    #byebug
    @project = Project.new(project_params)
    if @project.valid? &&@project.save(validate: false)
      flash[:success]="Project created!"
      redirect_to @project
    else
      render 'new'
    end
  end


  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success]="The project has been updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "The project has been deleted"
    redirect_to projects_url  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:project_name, :course_id)
    end
end
