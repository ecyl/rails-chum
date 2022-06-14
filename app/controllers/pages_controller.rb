class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # navbar links
    @banner_navbar = true
    @black_text_navbar = true

    @itineraries = Itinerary.order(created_at: :desc)
  end
end
