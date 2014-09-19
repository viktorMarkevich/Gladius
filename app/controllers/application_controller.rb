class ApplicationController < ActionController::Base
  include Twitter::Bootstrap::Breadcrumbs
  helper_method :sortable

  add_breadcrumb 'home', :root

  protect_from_forgery

  layout :layout_for_auth

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

  def sortable(column, title = nil)
    title ||= column.to_s.titleize
    css_class = column == sort_column.to_sym ? "current glyphicon glyphicon-arrow-#{sort_direction == :asc ? 'up' : 'down' }" : nil
    direction = column == sort_column.to_sym && sort_direction.to_sym == :asc ? :desc : :asc
    view_context.link_to :sort => column, :direction => direction do
      "<span class='#{css_class}'></span> #{title}".html_safe
    end
  end

  private
    def layout_for_auth
      if devise_controller?
        "authorization"
      else
        "application"
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
