class Chatroom < ApplicationRecord
  has_many :users, through: :user_chatrooms
end
