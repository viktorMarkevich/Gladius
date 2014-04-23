class UsersController < ApplicationController

  before_filter :find_user, :only => [:update, :edit, :show]

  def index
   @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes!(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

 private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me,
                                 :about, :birthday, :first_name, :last_name, :second_name,
                                 :sex, :weight, :login, :avatar, :role, user_school_relations_attributes:  [ :member_id,
                                 :school_id, :level, :status, :role],
                                 contact_info_attributes: [:site, :phone, :skype, :country, :city, :address])
  end
end
