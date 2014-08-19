class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.is_a? User
      users_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    if current_admin_user.is_a? AdminUser
      super
    elsif resource.is_a? User
      users_path
    else
      super
    end
  end


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
