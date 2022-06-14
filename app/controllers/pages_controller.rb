class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @banner_navbar = true
    @itineraries = Itinerary.order(created_at: :desc)
  end
end
