class MembersController < ApplicationController

  before_filter :find_user_of_school, :only => [:show, :edit, :update]

  def index
    @members = current_school.users
    @school =  current_school
  end

  def show
  end

  def new
    @member = User.new()
    @member.build_contact_info
    @member.build_user_school_relation
  end

  def edit
  end

  def create
    params[:member][:user_school_relation_attributes].merge!(:school_id => params[:school_id])
    member = User.new(params[:member])
    member.password = member.password_confirmation = :'123456'
    if member.save!
      redirect_to :school_members
    else
      render :back
    end
  end

  def update
    if @member.update_attributes(params[:member])
      redirect_to :school_member, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    UserSchoolRelation.where(:school_id => params[:school_id], :user_id => params[:id]).first.destroy
    redirect_to school_members_path, notice: 'Student was expelled!'
  end

  private

  def current_school
    School.find(params[:school_id])
  end

  def find_user_of_school
    @member = current_school.users.find(params[:id])
  end
end
