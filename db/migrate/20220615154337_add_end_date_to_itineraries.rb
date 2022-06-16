class AddEndDateToItineraries < ActiveRecord::Migration[6.1]
  def change
    add_column :itineraries, :end_date, :datetime
  end
end
