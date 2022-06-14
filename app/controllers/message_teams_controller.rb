class MessageTeamsController < ApplicationController

  def create
    @chatroom_team = ChatroomTeam.find(params[:chatroom_team_id])
    @message_team = MessageTeam.new(message_params)
    authorize @message_team
    @message_team.chatroom_team = @chatroom_team
    @message_team.user = current_user
    if @message_team.save
      redirect_to chatroom_team_path(@chatroom_team, anchor: "message_team-#{@message_team.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message_team).permit(:content)
  end
end
