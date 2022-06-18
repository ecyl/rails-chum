class CreateNotificationInitiators < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_initiators do |t|
      t.references :user, null: false, foreign_key: true
      t.references :itinerary, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
