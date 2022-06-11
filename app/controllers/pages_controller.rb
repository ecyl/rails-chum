class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @itineraries = Itinerary.order(created_at: :desc)
  end
end
