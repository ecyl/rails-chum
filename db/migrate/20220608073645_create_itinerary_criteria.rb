class CreateItineraryCriteria < ActiveRecord::Migration[6.1]
  def change
    create_table :itinerary_criteria do |t|
      t.text :description
      t.references :itinerary, null: false, foreign_key: true
      t.references :criteria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
