class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  # POST /resource
  def create
    super do |resource|
      resource.build_image
      resource.save
    end
  end

end