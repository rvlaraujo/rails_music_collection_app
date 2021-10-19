class ApplicationController < ActionController::Base
  
  # Devise configurations for use custom field for User model
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :full_name, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :full_name, :password, :current_password)
    end
  end
end
