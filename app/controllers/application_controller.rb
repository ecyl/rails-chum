class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :gender])
    devise_parameter_sanitizer.permite(:account_update, keys: [:first_name, :last_name, :age, :gender])
  end
end
