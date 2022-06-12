class AnnouncementsController < ApplicationController
  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @announcement = Announcement.new(announcement_params)
    @itinerary.announcements << @announcement

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to itinerary_path(@itinerary) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "itineraries/show" }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content)
  end
end
