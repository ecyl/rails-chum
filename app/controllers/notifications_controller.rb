class NotificationsController < ApplicationController

  def index
    @notifications = Notification.find(params[:id]).order(created_at: :desc)
  end
end
