class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  has_many :events, dependent: :destroy
  has_many :announcements, dependent: :destroy

  has_many :itinerary_users, dependent: :destroy
  has_many :users, through: :itinerary_users

  has_many :itinerary_restrictions, dependent: :destroy
  has_many :restrictions, through: :itinerary_restrictions

  # Validations
  validates :title, presence: true
  validates :participant_limit, presence: true
  # validates :location, presence: true
  validates :deadline, presence: true
  validates :chatroom_id, presence: true
  validates :destination, presence: true

  has_one_attached :photo

  def organiser
    user
  end

  # Queries after start
  def cost
    events.pluck(:cost).sum
  end

  def accepted?(user)
    users.include?(user)
  end
end
