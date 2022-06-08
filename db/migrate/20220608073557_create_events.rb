class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :date_start
      t.datetime :date_end
      t.float :cost
      t.string :location
      t.string :title
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
