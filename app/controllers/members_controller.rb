class MembersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_filter :find_member, only: [:show, :edit, :update]
  before_filter :current_school, only: [:index, :edit]

  def index
    @members = @school.members
    add_breadcrumb 'schools', school_path(@school)
    add_breadcrumb @school.id, school_path(@school)
    add_breadcrumb 'members', school_members_path(@school.id)
  end

  def show
    add_breadcrumb 'schools', school_path(@school)
    add_breadcrumb @school.id, school_path(@school)
    add_breadcrumb 'members', school_members_path(@school.id)
    add_breadcrumb @member.id, school_member_path(@school.id, @member.id)
  end

  def new
    @member = Member.new()
    @member.build_contact_info
    @member.build_user_school_relation( school_id: params[:school_id] )
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    @member.password = @member.password_confirmation = :'123456'
    @member.build_image
    if @member.save
      redirect_to school_members_path(school_id: params[:school_id])
    else
      render action: 'new'
    end
  end

  def update
    if @member.update_attributes(member_params)
      redirect_to :school_member, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    UserSchoolRelation.where( school_id: params[:school_id], member_id: params[:id]).first.destroy
    render action: 'index', notice: 'Student was expelled!'
  end

  private

  def current_school
    @school = School.find(params[:school_id])
  end

  def find_member
    @member = current_school.members.find(params[:id])
  end

  def member_params
    params.require(:member).permit( :about, :email, :birthday, :first_name, :last_name, :second_name, :sex, :weight,
                                    :avatar, :role, :kind, contact_info_attributes: [ :site, :phone, :skype, :country,
                                    :city, :address ], user_school_relation_attributes: [ :member_id, :school_id,
                                    :level, :status, :role ], image_attributes: [:avatar] )
  end
end
