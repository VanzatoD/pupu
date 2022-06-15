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
      Membership.create!(user: current_user, team: @team)
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
    @memberships = @team.memberships.joins(:user).pluck(:username)
    @posts = []
    @team.memberships.each do |member|
      @posts << member.user.posts
    end
    @posts = @posts.flatten
  end



  private

  def team_params
    params.require(:team).permit(:title)
  end
end
