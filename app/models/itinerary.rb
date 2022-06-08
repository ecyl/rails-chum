class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  has_many :events
  has_many :announcements

  has_many :itinerary_criteria
  has_many :criteria, through: :itinerary_criteria

  has_many :itinerary_users
  has_many :users, through: :itinerary_users
end
