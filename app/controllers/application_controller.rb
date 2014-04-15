class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :remember_me, :current_password)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :remember_me)
    end

  end

end
