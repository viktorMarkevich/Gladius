class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end
  def new
    @school = School.new
  end

  def show
    @school = School.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(params[:school])
    #@school.users << current_user

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render json: @school, status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @school = School.find(params[:id])
    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.users.each do |user|
      user.update_attributes(:school_id => 0, :role => "fighter")
    end
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  def school_has_users
    @school = School.find(params[:school_id])
    @users_of_school = @school.users
  end

  def expelled
    @user = School.find(params[:school_id]).users.find(params[:id])
    @user.update_attributes(:school_id => 0, :role => "fighter", :status => "fighter")
    redirect_to school_has_users_path, notice: 'Student was expelled!'
  end
end
