class UsersController < ApplicationController
  def show
    @user = authorize User.find(params[:id])
    @static_navbar = true

    @reviews = []
    @organised_trips = []
    @user.itineraries.each do |itinerary|
      if !itinerary.reviews.length.zero?
        itinerary.reviews.each do |review|
          @reviews << review
        end
      end

      if itinerary.itinerary_users.where(status: "organiser").include?(@user)
        @oragnised_trips << itinerary
      end
    end
  end
end
