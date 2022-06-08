class CreateUserChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_chatrooms do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
