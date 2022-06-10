class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(current_user.chatroom_ids)
    authorize @chatroom
    @message = Message.new
  end
end
