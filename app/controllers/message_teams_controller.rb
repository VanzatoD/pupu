class MessageTeamsController < ApplicationController

  def create
    @chatroom_team = ChatroomTeam.find(params[:chatroom_team_id])
    @message_team = MessageTeam.new(message_params)
    authorize @message_team
    @message_team.chatroom_team = @chatroom_team
    @message_team.user = current_user
    if @message_team.save
      ChatroomTeamChannel.broadcast_to(
        @chatroom_team,
        render_to_string(partial: "message_team", locals: { message_team: @message_team })
      )
      head :ok
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message_team).permit(:content)
  end
end
