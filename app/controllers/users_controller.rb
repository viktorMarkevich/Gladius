class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_filter :find_user, :only => [:update, :edit, :show]

  def index
   @users = User.all.order(id: :asc)
  end

  def show
  end

  def edit
    # @user.build_contact_info
    # @user.build_image
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: :edit
    end
  end

 private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :email, :password, :password_confirmation, :remember_me, :about, :birthday,
                                  :first_name, :last_name, :second_name, :sex, :weight, :login, :avatar, :role,
                                  contact_info_attributes: [:site, :phone, :skype, :country, :city, :address],
                                  image_attributes: [:avatar] )
  end
end
