class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super do |resource|
      resource.build_image
      resource.save
    end
  end

end