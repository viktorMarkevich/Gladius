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
                    :about, :birthday, :first_name, :last_name, :level, :second_name,
                    :sex, :status, :weight, :login, :avatar, :role, :user_school_relations_attributes,
                    :contact_info_attributes)
  end
end
