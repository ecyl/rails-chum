class Chatroom < ApplicationRecord
  # scope :direct_messages, ->(id) { joins(:itineraries).where.not(itineraries: { chatroom_id: id }) }

  scope :private_chats, -> { where.not(id: Itinerary.pluck(:chatroom_id)) }

  has_one :itinerary
  has_many :messages, dependent: :destroy

  has_many :user_chatrooms, dependent: :destroy
  has_many :users, through: :user_chatrooms


  def private?
    !itinerary_room?
  end

  def itinerary_room?
    itinerary.present?
  end
end
