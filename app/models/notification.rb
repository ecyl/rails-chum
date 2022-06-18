class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  has_one :notification_initiator
end
