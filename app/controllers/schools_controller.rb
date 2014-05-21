class SchoolsController < ApplicationController

  before_filter :find_school, :only => [:show, :edit, :update]

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
    @school = School.new(school_params.merge(:creator_id => params[:user_id]))
    if @school.save!
      UserSchoolRelation.create(:member_id => params[:user_id], :school_id => @school.id, :role => "admin" )
      redirect_to user_school_path(params[:user_id], @school.id), :action => :show, :notice => 'Article saved successfully!'
    else
      render new_user_school_path
    end
  end

  def update
      if @school.update(school_params)
        redirect_to user_school_path(params[:user_id], @school.id), :action => :show
      else
        render action: "edit"
      end
  end

  def destroy
    School.find_by_creator_id(params[:user_id]).destroy
    redirect_to :back
  end

  private

  def find_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:date_of_foundation, :info, :name, :status, :creator_id, :contact_info_attributes)
  end

end
