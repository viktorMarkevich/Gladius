class UsersInvitationsController < Devise::InvitationsController
# GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    render :edit, :layout => false
  end

# PUT /resource/invitation
  def update
    self.resource = resource_class.accept_invitation!(resource_params)

    if resource.errors.empty?
      resource.build_image
      resource.save
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)

      redirect_to edit_user_path(resource), :alert => "Welcome! Please fill out your profile and upload a headshot."
    else
      respond_with_navigational(resource){ render :edit, :layout => false }
    end
  end

  private

  def resource_params
    params.require(:user).permit(:invitation_token, :password, :password_confirmation)
  end

end