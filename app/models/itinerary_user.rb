class ItineraryUser < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  private

  def notify_recipient
    if status == 'pending'
      CommentNotification.with(message: "self").deliver_later(current_user)
    end
  end
end

# CommentNotification.with(post: @post).deliver(current_user)
