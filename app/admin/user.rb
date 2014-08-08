ActiveAdmin.register User do

  # permit_params :first_name, :last_name, :email
  permit_params do
    params = [:first_name, :last_name, :email]
    params
  end

  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation, method: :get  do
    @user = User.new
  end

  collection_action :send_invitation, :method => :post do
    @user = User.invite!(permitted_params[:user], current_admin_user)
    if @user.errors.empty?
      flash[:success] = "User has been successfully invited."
      redirect_to admin_users_path
    else
      messages = @user.errors.full_messages.map { |msg| msg }.join
      flash[:error] = "Error: " + messages
      redirect_to new_invitation_admin_users_path
    end
  end
end
