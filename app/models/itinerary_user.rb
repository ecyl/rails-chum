class ItineraryUser < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user
  after_create_commit :notify_recipient

  private

  def notify_recipient
    if status == 'pending'
      f_name = "#{self.user.first_name} #{self.user.last_name}"
      CommentNotification.with(
        message: "#{f_name} has requested to join your itinerary #{self.itinerary.title}",
        notification_type: "new_pending"
      ).deliver(self.itinerary.user)

    end
  end
end

# CommentNotification.with(post: @post).deliver(current_user)
