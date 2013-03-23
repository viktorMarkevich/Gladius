class UsersController < ApplicationController

  before_filter :find_user, :only => [:update, :edit, :show, :destroy]

  def index
   @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user.build_contact_info
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
