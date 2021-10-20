class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Devise configurations for use custom field for User model
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    artists_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :full_name, :role, :password) }
    devise_parameter_sanitizer.permit :sign_in, keys: %i[username password]
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :full_name, :role, :password, :current_password)
    end
  end
end
