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
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

 private

  def find_user
    @user = User.find(params[:id])
  end
end
