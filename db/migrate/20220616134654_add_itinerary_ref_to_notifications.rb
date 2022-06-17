class AddItineraryRefToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :itinerary, null: true, foreign_key: true
  end
end
