class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).where(id: current_user.chatroom_ids)
  end

  def show
    @chatroom = authorize Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    itinerary = Itinerary.find(params[:itinerary_id])
    # find the organiser
    organiser_id = itinerary.user_id
    @organiser_details = User.find(organiser_id)
    @chatroom = authorize Chatroom.new
  end

  def create
    @chatroom = authorize Chatroom.new(chatroom_params)
  end

  private
  def chatroom_param

  end
end
