class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
    @contact = resource.build_contact_info

    if @contact.save
      [:email, :skype, :site, :phone].each do |contact_type|
        if params[contact_type].try(:[], :body).blank?
          @contact.send(contact_type.to_s.pluralize).create
        else
          params[contact_type][:body].split(',').each do |elem|
            resource.contact_infos.send(contact_type).create(:body => elem)
          end
        end
      end
    end
  end

  def update
    super
  end
end
