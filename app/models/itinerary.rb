class Itinerary < ApplicationRecord
  belongs_to :organiser
  belongs_to :chatroom
  has_many :events
  has_many :users, through: :itinerary_users
  has_many :criteria, through: :itinerary_criterium
  has_many :announcements

  # Validations
  validates :title, presence: true
  validates :location, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :cost, numericality: { only_integer: true, greater_than: 0 }
  validates :deadline, presence: true
  validates :chatroom_id, presence: true
end
