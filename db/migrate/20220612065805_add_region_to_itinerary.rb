class AddRegionToItinerary < ActiveRecord::Migration[6.1]
  def change
    add_column :itineraries, :region, :string
  end
end
