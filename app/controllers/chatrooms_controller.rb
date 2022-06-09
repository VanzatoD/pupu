class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
    @chatrooms = Chatroom.all
    authorize @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
