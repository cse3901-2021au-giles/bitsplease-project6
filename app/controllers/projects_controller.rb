=begin
  A control to process the project view, create, update, delete requests
  Only an instructor or TA can create, update, or delete a project
  The instructor or TA can only view the projects belong to courses that they teach.
=end
class ProjectsController < ApplicationController
  # only available to instructors and TAs
  before_action :correct_admin_user, only: [:index, :show, :new, :edit, :update, :destroy]

  # set @project object
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    # Only projects belong to the courses that the current user teaches
    @projects = Project.all.order("project_name asc").reject{|p| p.course.users.exclude? current_user}
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    if(@project.course.user_ids.exclude?(current_user.id))
      flash[:success]="You are not an instructor or TA of the course of this project"
      redirect_to @course
    else
        render 'edit'
    end
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
    if @project.update(project_params)
      flash[:success]="The project has been updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    # make sure the current user is an instructor or TA of the project before letting him/her
    # delete it
    if(@project.course.user_ids.exclude?(current_user.id))
      flash[:success]="You are not an instructor or TA of the course of this project"
      redirect_to @course
    else
      @project.destroy
      flash[:success] = "The project has been deleted"
      redirect_to projects_url  
    end
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
