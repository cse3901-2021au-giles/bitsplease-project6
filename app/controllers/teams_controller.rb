class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def index
    @teams = if current_user && current_user.admin?
               Team.all.order('name')
             else
               Team.all.reject { |p| p.users.exclude? current_user }
             end
  end

  def new
    @team=Team.new
    @edit_team=false
  end

  def create
    # byebug
    @team = Team.new(team_params)
    if @team.valid? && @team.save(validate: false)
      flash[:success] = 'Team created and you can add students now'
      redirect_to edit_team_path(@team)
    else
      render 'new'
    end
  end

  def show
    @team=Team.find(params[:id])
    @team_in_my_courses = true unless @team.course_admins.exclude?(current_user)
 
  end

  def edit
    @team=Team.find(params[:id])
    @edit_team=true
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success] = 'The has been updated.'
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = 'Team deleted'
    redirect_to teams_url
  end

  private

  def team_params
    params.require(:team).permit(:name, :project_id, user_ids: [])
  end
end
