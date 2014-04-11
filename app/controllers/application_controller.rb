class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    edit_user_registration_path(resource) if resource.sign_in_count <= 1
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me, :current_password)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me)
    end

  end

end
