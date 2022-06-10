class AddDestinationToItinerary < ActiveRecord::Migration[6.1]
  def change
    add_column :itineraries, :destination, :string
  end
end
