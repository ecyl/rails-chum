class ItineraryUser < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :user, uniqueness: { scope: :itinerary, message: "You can only make a request to join an itinerary once." }
end
