class Chatroom < ApplicationRecord
  has_many :messages

  has_many :users, through: :user_chatrooms
  has_many :user_chatrooms
end
