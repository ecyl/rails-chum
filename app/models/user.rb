class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :notifications, dependent: :destroy
  has_many :notifications, as: :recipient
  has_many :messages, dependent: :destroy

  has_many :itinerary_users
  has_many :itineraries, through: :itinerary_users, dependent: :destroy
  has_many :user_chatrooms
  has_many :chatrooms, through: :user_chatrooms, dependent: :destroy

  has_one_attached :photo

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, presence: true
end
