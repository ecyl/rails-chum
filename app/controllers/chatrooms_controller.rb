class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.where(id: current_user.chatrooms)
    authorize @chatroom
    @message = Message.new
  end
end
