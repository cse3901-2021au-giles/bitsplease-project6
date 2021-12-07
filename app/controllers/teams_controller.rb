=begin
  A control to process the team view, create, update, delete requests
  Only an instructor or TA can create, update, or delete a project
  The instructor or TA can only view the teams belong to courses that they teach.
=end
class TeamsController < ApplicationController
  # only available to teachers, TAs, or students
  before_action :correct_team_grade_user, only: [:index, :show, :new, :edit, :update, :destroy]
  # set @team object
  before_action :set_team, only: %i[ show edit update destroy ]

  def index
    # An instructor or TA can view teams belong to the courses he/she teach
    # A student can only view teams he is a member of.
    if current_user.admin?  
      @teams=Team.all.reject{|t| t.project.course.user_ids.exclude?(current_user.id)}
    else
      @teams = Team.all.reject{|p| p.users.exclude? current_user}
    end
  end

  def new
    @team=Team.new
    @edit_team=false
    #load all projects belong to courses that the current user teaches
    @course_projects=Project.all.order("project_name asc").reject{|p| p.course.users.exclude? current_user}
  end

  def create
    #Make sure sure all required team info is provided before creating a team
    @team = Team.new(team_params)
    if @team.valid? && @team.save(validate: false)
        flash[:success]="Team created and you can add students now"
        redirect_to edit_team_path(@team)
    else
      render 'new'
    end
  end
 
  def show
  end

  def edit
    @edit_team=true
    @course_projects=Project.all.order("project_name asc").reject{|p| p.course.users.exclude? current_user}
  end

  
  def update
    #update the team and redirect the user to the team details page
    if @team.update(team_params)
      flash[:success]="The has been updated."
      redirect_to @team
    else
      render 'edit'
    end
  end


  def destroy
    #delete the team and redirect the user to the team summary page
    @team.destroy
    flash[:success] = "Team deleted"
    redirect_to teams_url    
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end
  def team_params
    params.require(:team).permit(:name, :project_id, user_ids:[])
  end
end
