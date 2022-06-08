class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications
  has_many :messages

  has_many :user_chatrooms
  has_many :chatrooms, through: :user_chatrooms

  has_many :itinerary_users
  has_many :itineraries, through: :itinerary_users
end
