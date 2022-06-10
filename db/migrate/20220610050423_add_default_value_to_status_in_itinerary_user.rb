class AddDefaultValueToStatusInItineraryUser < ActiveRecord::Migration[6.1]
  def change
    change_column :itinerary_users, :status, :string, default: 'pending'
  end
end
