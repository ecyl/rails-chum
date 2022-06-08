class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
  end

  def create
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :participant_limit, :description,
                                      :deadline, :finalised, :user_id, :chatroom_id)
  end
end
