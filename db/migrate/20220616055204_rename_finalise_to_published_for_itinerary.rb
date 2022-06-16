class RenameFinaliseToPublishedForItinerary < ActiveRecord::Migration[6.1]
  def change
    rename_column :itineraries, :finalised, :published
  end
end
