class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    edit_user_registration_path(resource) if resource.sign_in_count <= 1
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me) }
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end

end
