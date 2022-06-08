class Itinerary < ApplicationRecord
  belongs_to :organiser
  belongs_to :chatroom
  has_many :events
  has_many :users, through: :itinerary_users
  has_many :criteria, through: :itinerary_criterium
  has_many :announcements
end
