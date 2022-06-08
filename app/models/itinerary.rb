class Itinerary < ApplicationRecord
  belongs_to :organiser
  belongs_to :chatroom
end
