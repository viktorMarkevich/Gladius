class SchoolsController < ApplicationController

  before_filter :find_school, :only => [:show, :edit, :update, :destroy]

  def index
    @schools = if params[:user_id].present?
                 User.find(params[:user_id]).schools
               else
                 School.all
               end
  end

  def new
    @school = School.new
  end

  def show
  end

  def edit
  end

  def create
    @school = School.new(params[:school])
    if @school.save
      UserSchoolRelation.create(:member_id => current_user.id, :school_id => @school.id, :role => "admin" )
      redirect_to @school, notice: 'School was successfully created.'
    else
      render action: "new"
    end
  end

  def update
      if @school.update_attributes(params[:school])
        redirect_to @school, notice: 'School was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    UserSchoolRelation.where(:school_id => @school.id).destroy_all
    @school.destroy
     redirect_to schools_url
  end

  private

  def find_school
    @school = School.find(params[:id])
  end

end
