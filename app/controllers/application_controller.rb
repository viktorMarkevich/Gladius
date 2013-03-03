class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    edit_user_registration_path(resource) if resource.sign_in_count <= 1
  end

end
