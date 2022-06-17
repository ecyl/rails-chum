class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  has_many :events, dependent: :destroy
  has_many :announcements, dependent: :destroy

  has_many :itinerary_users, dependent: :destroy
  has_many :users, through: :itinerary_users

  has_many :itinerary_restrictions, dependent: :destroy
  has_many :restrictions, through: :itinerary_restrictions

  has_many :reviews

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
    self.users.include?(user)
    users.include?(user)
  end


  def start_time
    self.events.date_start
  end

  # start_date method to get start_date of itinerary, which is the start date of the 1st event
  # def start_date
  #   events.order(date_start: :asc).first.date_start
  # end
  # start_date method to get end_date of itinerary, which is the end date of the last event
  # def end_date
  #   events.order(date_start: :desc).first.date_end
  # end

end
