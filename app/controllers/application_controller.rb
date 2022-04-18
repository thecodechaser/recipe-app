# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def api_path
    request.original_url.include?('api')
  end
end
