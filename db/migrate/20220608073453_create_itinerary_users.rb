class CreateItineraryUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :itinerary_users do |t|
      t.string :status
      t.text :message
      t.references :itinerary, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
