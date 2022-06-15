class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  after_create_commit :broadcast_notification

  private

  def broadcast_notification
    id = params[:id]
    string = ApplicationController.new.render_to_string(partial: "notifications/notification", locals: { notification: params[:message] })
    ActionCable.server.broadcast(
      "notifications-#{id}",
      string)
  end
end
