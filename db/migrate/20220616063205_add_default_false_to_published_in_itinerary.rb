class AddDefaultFalseToPublishedInItinerary < ActiveRecord::Migration[6.1]
  def change
    change_column :itineraries, :published, :boolean, default: false
  end
end
