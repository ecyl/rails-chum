class NotificationDropdownChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    user = User.find(params[:id])
    stream_from "notification-dropdown-#{user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
