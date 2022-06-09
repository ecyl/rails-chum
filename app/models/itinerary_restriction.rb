class ItineraryRestriction < ApplicationRecord
  belongs_to :itinerary
  belongs_to :restriction
end
