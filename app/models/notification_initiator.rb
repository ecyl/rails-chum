class NotificationInitiator < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  belongs_to :notification
end
