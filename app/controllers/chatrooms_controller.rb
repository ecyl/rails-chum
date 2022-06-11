class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).where(id: current_user.chatroom_ids)
  end

  def show
    @chatroom = authorize Chatroom.find(params[:id])
    @message = Message.new
  end

  # creating new chats from itinerary show
  def new
    itinerary = Itinerary.find(params[:itinerary_id])
    # find the organiser
    organiser_id = itinerary.user_id
    @organiser_details = User.find(organiser_id)
    @chatroom = authorize Chatroom.new
  end

  def create
    @chatroom = authorize Chatroom.new(chatroom_params)

    # assign chatroom to current user
    @chatroom.users << current_user

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
