class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    super
    @contact = resource.build_contact_info

    if @contact.save
      #[:email, :skype, :site, :phone].each do |contact_type|
      #  if params[contact_type].try(:[], :body).blank?
      #    @contact.send(contact_type.to_s.pluralize).create
      #  else
      #    params[contact_type][:body].split(',').each do |elem|
      #      resource.contact_infos.send(contact_type).create(:body => elem)
      #    end
      #  end
      #end
    end
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:login, :email, :password, :password_confirmation, :password, :remember_me, :current_password)
    end
  end

end
