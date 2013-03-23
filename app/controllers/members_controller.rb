class MembersController < ApplicationController

  def index
    @members = current_school.users
  end

  def show
    @member = current_school.users.find(params[:id])
  end

  def new
    @member = User.new()
  end

  def edit
  end

  def create
    params_contact_info = params[:member][:contact_info_attributes]
    params_user_school_relation = params[:member][:user_school_relations_attributes]
    member = User.new(params[:member].delete_if  {|key| key == "user_school_relations_attributes" || key == "contact_info_attributes" })
    member.password = member.password_confirmation = :'123456'
    contacts = member.build_contact_info
    member.build_user_school_relations

    if member.save!

    else
      render :back
    end
    i = 0
  end

  def update
  end

  def destroy
  end

  private

  def current_school
    School.find(params[:school_id])
  end
end
