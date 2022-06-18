class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  has_many :notification_initiators
end
