class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  private

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
