class CreateItineraryRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :itinerary_restrictions do |t|
      t.string :title
      t.integer :min_age
      t.integer :max_age
      t.string :restricted_gender


      t.text :description
      t.references :itinerary, null: false, foreign_key: true
      t.references :restrictions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
