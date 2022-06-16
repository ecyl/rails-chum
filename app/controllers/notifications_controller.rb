class NotificationsController < ApplicationController

  def index
    # @notifications = Notification.where(user_id: current_user.id).order(created_at: :desc)
    @notifications = policy_scope(Notification).where(user_id: current_user.id).order(created_at: :desc)
    authorize @notifications
  end
end
