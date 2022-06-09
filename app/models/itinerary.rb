class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  has_many :events, dependent: :destroy
  has_many :announcements, dependent: :destroy

  has_many :itinerary_users, dependent: :destroy
  has_many :users, through: :itinerary_users

  has_many :itinerary_restrictions, dependent: :destroy
  has_many :restrictions, through: :itinerary_criterium

  # Validations
  validates :title, presence: true
  # validates :location, presence: true
  validates :deadline, presence: true
  validates :chatroom_id, presence: true
end
