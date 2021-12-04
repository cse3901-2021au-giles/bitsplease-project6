class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.project_name='test project'
    @project.course_id=2
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    byebug
    @project = Project.new(project_params)
    @project.course_id=params[:parent_id]
    #@course =Course.find(@project.parent_id)
    if @project.save(validate: false)
      flash[:success]="Course created!"
      redirect_to @course
    else
      render 'new'
    end
  end


  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:project_name, :parent_id)
    end
end
