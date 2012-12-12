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

    respond_to do |format|
      if @school.save
        @user_school_relations = UserSchoolRelation.new(:school_id => @school.id, :user_id => current_user.id)
        if @user_school_relations.save
          format.html { redirect_to @school, notice: 'School was successfully created.' }
          format.json { render json: @school, status: :created, location: @school }
        end
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
    @user_school_relations = UserSchoolRelation.where(:school_id => @school.id)
    @user_school_relations.pluck(:user_id).each do |id|
      User.find(id).update_attributes(:role => change_role?(id), :status => "fighter")
    end
    @user_school_relations.destroy_all
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  def school_has_users
    @school = School.find(params[:school_id])
    @users_of_school = User.where(:id => @school.user_school_relations.pluck(:user_id))
  end

  def expelled
    @user = School.find(params[:school_id]).user.find(params[:id])
    UserSchoolRelation.where(:school_id => params[:school_id], :user_id => params[:id]).destroy_all
    @user.update_attributes(:role => "fighter", :status => "fighter")
    redirect_to school_has_users_path, notice: 'Student was expelled!'
  end

  def change_role?(id)
    User.where(:id => id, :role => "manager").present? ? "manager" : "fighter"
  end
end
