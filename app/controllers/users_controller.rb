class UsersController < ApplicationController
  def show
    @user = authorize User.find(params[:id])
    @static_navbar = true

    @reviews = []
    @user.itineraries.each do |itinerary|
      if !itinerary.reviews.length.zero?
        itinerary.reviews.each do |review|
          @reviews << review
        end
      end
    end
  end
end
