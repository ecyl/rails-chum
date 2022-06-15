class NotificationsController < ApplicationController
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
    # @notifications = current_user.notifications
    authorize @notifications
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
