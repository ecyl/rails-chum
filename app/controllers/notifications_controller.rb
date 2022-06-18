class NotificationsController < ApplicationController

  def index
    # @notifications = Notification.where(user_id: current_user.id).order(created_at: :desc)
    @notifications = policy_scope(Notification).where(user_id: current_user.id).order(created_at: :desc)
    @notifications.each do |notification|
      mark_as_read!(notification)
      notification.save
    end
    authorize @notifications
  end

  def mark
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
  end

end
