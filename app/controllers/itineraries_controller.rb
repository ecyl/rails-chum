class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: :show
  def index
    @itineraries = Itinerary.all
  end

  def show
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    Itinerary.transaction do
      @itinerary = Itinerary.new(itinerary_params)
      @itinerary.user = current_user

      @chatroom ||= Chatroom.new
      @itinerary.chatroom = @chatroom

      @chatroom.users << current_user
      # @chatroom_user = @chatroom.user_chatrooms.build(user: @itinerary.user)
      @chatroom.save!

      @itinerary.save!
      redirect_to itinerary_path(@itinerary)
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end



  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :participant_limit, :description,
                                      :deadline, :finalised, :photo)
  end


  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
