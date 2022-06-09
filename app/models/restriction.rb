class Restriction < ApplicationRecord
  has_many :itinerary_restrictions
  has_many :itineraries, through: :itinerary_restriction
end
