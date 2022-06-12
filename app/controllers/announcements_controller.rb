class AnnouncementsController < ApplicationController
  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @announcement = Announcement.new(announcement_params)
    @itinerary.annoucement = @announcement
    if @announcement.save
      redirect_to itinerary_path(@itinerary)
    else
      render 'itineraries/show'
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content)
  end
end
