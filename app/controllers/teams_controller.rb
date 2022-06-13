class TeamsController < ApplicationController
  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    @team.user = current_user
    if @team.save
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  private

  def team_params
    params.require(:team).permit(:title)
  end
end
