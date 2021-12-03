class TeamsController < ApplicationController

  def index
    @teams = Team.paginate(page: params[:page])
  end
  def new
    @team=Team.new
  end
  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success]="Team created!"
      redirect_to teams_url
    else
      render 'new'
    end
  end
 
  def show
    @team=Team.find(params[:id])
  end

  def edit
    @team=Team.find(params[:id])
  end

  
  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success]="Your profile has been updated."
      redirect_to @team
    else
      render 'edit'
    end
  end


  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted"
    redirect_to teams_url    
  end 

  private

  def team_params
    params.require(:team).permit(:name, :description, user_ids:[])
  end
end
