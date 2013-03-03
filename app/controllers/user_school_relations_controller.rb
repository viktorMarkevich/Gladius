class UserSchoolRelationsController < ApplicationController

  #before_filter :find_user, :only => [:index]
  before_filter :find_school, :only => [:index]

  def index
    @users = User.where(:id => @school.user_school_relations.pluck(:user_id))
  end

  def new
    @user_school_relation = UserSchoolRelation.new
  end

  def show
  end

  def edit
  end

  def create
    #  school_id = params[:user][:user_school_relations]
    #  @user = User.new(params[:user].delete_if  {|key| key == "user_school_relations" }.update(:role => select_role ))
    #  @user.password = @user.password_confirmation = :'123456'
    #  @contact = @user.build_contact_info
    #
    #  if @user.save!
    #    [:email, :skype, :site, :phone].each do |contact_type|
    #      if params[contact_type].try(:[], :body).blank?
    #        @contact.send(contact_type.to_s.pluralize).create
    #      else
    #        redirect_to users_path
    #      end
    #    end
    #    create_user_school_relation(@user, school_id)
    #    UserMailer.notification_you_have_added(@user, @user.password).deliver
    #    redirect_to users_path
    #  else
    #    redirect_to users_path
    #  end
  end

  #def create_user_school_relation(user, school_id)
  #  UserSchoolRelation.create(:user_id => @user.id || user.id, :school_id => params[:user][:user_school_relations] || school_id)
  #end
  #
  #def select_role
  #  params[:user][:role].present? ? params[:user][:role] : "pupil"
  #end

  #def add_user_
  #  school_id = params[:user][:user_school_relations]
  #  @user = User.new(params[:user].delete_if  {|key| key == "user_school_relations" }.update(:role => select_role ))
  #  @user.password = @user.password_confirmation = :'123456'
  #  @contact = @user.build_contact_info
  #
  #  if @user.save!
  #    [:email, :skype, :site, :phone].each do |contact_type|
  #      if params[contact_type].try(:[], :body).blank?
  #        @contact.send(contact_type.to_s.pluralize).create
  #      else
  #        redirect_to users_path
  #      end
  #    end
  #    create_user_school_relation(@user, school_id)
  #    UserMailer.notification_you_have_added(@user, @user.password).deliver
  #    redirect_to users_path
  #  else
  #    redirect_to users_path
  #  end
  #end
  #
  #def expelled
  #  @user = School.find(params[:school_id]).user.find(params[:id])
  #  UserSchoolRelation.where(:school_id => params[:school_id], :user_id => params[:id]).destroy_all
  #  @user.update_attributes(:role => "fighter", :status => "fighter")
  #  redirect_to school_has_users_path, notice: 'Student was expelled!'
  #end

  #@user_school_relations = UserSchoolRelation.new(:school_id => @school.id, :user_id => current_user.id)
  #@user_school_relations.save
  #def change_role?(id)
  #  User.where(:id => id, :role => "manager").present? ? "manager" : "fighter"
  #end

  def find_user
    @user = User.find(params[:id])
  end

  def find_school
    @school = School.find(params[:school_id])
  end
end
