class SchoolsController < ApplicationController

  before_filter :find_school, :only => [:show, :edit, :update, :destroy]

  def index
    @schools = School.all
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
    @user_school_relations = UserSchoolRelation.where(:school_id => @school.id)
    @user_school_relations.pluck(:user_id).each do |id|
      User.find(id).update_attributes(:role => change_role?(id), :status => "fighter")
    end
    @user_school_relations.destroy_all
    @school.destroy
     redirect_to schools_url
  end

  private

  def find_school
    @school = School.find(params[:id] || params[:school_id])
  end

end
