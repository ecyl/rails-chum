class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :content
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
