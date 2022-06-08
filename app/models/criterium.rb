class Criterium < ApplicationRecord
  has_many :itinerary_criteria
  has_many :itineraries, through: :itinerary_criteria
end
