class UserChatroom < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  # cannot have same user twice for the same chatroom
  validates :user, uniqueness: { scope: :chatroom, message: "is already in the chatroom" }

  # if private, max of 2 participants
  validate :max_two_participants, if: :chatroom_is_private?
  # VALIDATION HELPER METHODS
  def max_two_participants
    errors.add(:chatroom, "already has two participants") if chatroom.reload.user_chatrooms.select(&:persisted?).size >= 2
  end

  def chatroom_is_private?
    chatroom.private?
  end
end
