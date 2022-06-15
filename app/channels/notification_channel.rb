class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # notification = Notification.find_by(recipient_id: current_user.id)
    recipient = User.find(params[:id]).id
    # stream_for current_user
    # stream_from "#{current_user.id}"
    stream_for recipient
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
