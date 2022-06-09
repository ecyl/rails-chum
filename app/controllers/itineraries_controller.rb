class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: :show
  def index
    @itineraries = Itinerary.all
  end

  def new
  end

  def show
    @itinerary
  end

  def create
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
