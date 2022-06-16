class NotificationsController < ApplicationController

  def index
    @notifications = Notification.find(params[:id]).order
  end
end
