class RemoveRegionFromItineraries < ActiveRecord::Migration[6.1]
  def change
    remove_column :itineraries, :region
  end
end
