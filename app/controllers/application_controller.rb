class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    edit_user_registration_path(resource) if resource.sign_in_count <= 1
  end
end
