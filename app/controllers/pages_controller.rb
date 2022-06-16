class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # navbar links
    @banner_navbar = true
    @black_text_navbar = true

    @itineraries = Itinerary.order(created_at: :desc)

    sample_itineraries = @itineraries.sample(5)
    @sample_events = []
    sample_itineraries.each do |itinerary|
      event = itinerary.events.sample(1)[0]
      @sample_events << event
    end

  end
end
