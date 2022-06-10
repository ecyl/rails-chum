class AddDestinationToItinerary < ActiveRecord::Migration[6.1]
  def change
    add_column :itinerary, :destination, :string
  end
end
