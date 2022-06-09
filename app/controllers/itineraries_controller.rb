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
    @itinerary.Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    @itinerary.chatroom = Chatroom.new

    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :participant_limit, :description,
                                      :deadline, :finalised)
  end


  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
