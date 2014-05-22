class MembersController < ApplicationController

  before_filter :find_member, only: [:show, :edit, :update]

  def index
    @members = current_school.members
  end

  def show
  end

  def new
    @member = Member.new()
    @member.build_contact_info
    @member.user_school_relations.build( school_id: params[:school_id] )
  end

  def edit
  end

  def create
    member = Member.new(member_params)
    member.password = member.password_confirmation = :'123456'
    if member.save!
      redirect_to :school_members
    else
      render :back
    end
  end

  def update
    if @member.update_attributes(member_params)
      redirect_to :school_member, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    UserSchoolRelation.where( school_id: params[:school_id], member_id: params[:id]).first.destroy
    redirect_to school_members_path, notice: 'Student was expelled!'
  end

  private

  def current_school
    School.find(params[:school_id])
  end

  def find_member
    @member = current_school.members.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation, :remember_me,
                                 :about, :birthday, :first_name, :last_name, :second_name,
                                 :sex, :weight, :login, :avatar, :role,
                                 contact_info_attributes: [:site, :phone, :skype, :country, :city, :address])
  end
end
