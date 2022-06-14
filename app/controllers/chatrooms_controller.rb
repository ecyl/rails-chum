class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).where(id: current_user.chatroom_ids)
    @message = Message.new
  end

  # should not have the chatroom show anymore
  # def show
  #   @chatroom = authorize Chatroom.find(params[:id])
  #   @message = Message.new
  #   if @chatroom.itinerary
  #     organiser_id = @chatroom.itinerary.user_id
  #     @organiser = User.find(organiser_id)
  #   end
  # end

  # creating new chats from itinerary show
  # def new
  #   itinerary = Itinerary.find(params[:itinerary_id])
  #   # find the organiser
  #   organiser_id = itinerary.user_id
  #   @organiser_details = User.find(organiser_id)
  #   @chatroom = authorize Chatroom.new
  # end

  def create
    # assign recipient and sender
    @recipient = User.find(params[:user_id])
    @sender = current_user
    @chatroom = authorize Chatroom.new
    # get sender's chatrooms
    sender_chatrooms = @sender.chatrooms

    # iterate through sender's chatrooms
    sender_chatrooms.each do |chatroom|
      # check the private chatrooms # check if there is already a chatroom between the sender and receiver
      if chatroom.users.length == 2 && chatroom.user_chatrooms.where(user_id: @recipient.id).present?
          # redirect to the chatroom path
          # should pass in an active chatroom parameter (the chatroom id)
        redirect_to chatrooms_path(chatroom: chatroom.id)
        return
      end
    end

    # else create a new chatroom
    # add the current user and the recipient (whoever you are talking to) to the new chatroom
    @chatroom.users << @recipient
    @chatroom.users << @sender

    if @chatroom.save
      redirect_to chatrooms_path(chatroom: @chatroom.id)
    else
      flash[:notice] = "There was a problem sending this message"
      redirect_to chatrooms_path(chatroom: @chatroom.id)
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end


end
