class NotificationsController < ApplicationController

  def index
    @notifications = policy_scope(Notification).where(recipient: current_user).order(created_at: :desc)
    authorize @notifications
  end
end
