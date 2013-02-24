class UsersController < ApplicationController

  before_filter :get_school, :only => [:edit, :new, :update]
  before_filter :find_a_user, :only => [:update, :edit, :show, :destroy, :create_user_school_relation]

  def index
    @users = User.select("users.*, CASE WHEN user_school_relations.id IS NULL THEN NULL ELSE TRUE END as school_relation")
      .joins(%Q{LEFT OUTER JOIN user_school_relations ON users.id = user_school_relations.user_id})
      .group("users.id, school_relation")
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    create_user_school_relation(@user, params[:user][:user_school_relations]) if params[:user][:user_school_relations].present?
    if @user.update_attributes(params[:user].delete_if  {|key| key == "user_school_relations" })
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def add_user
    school_id = params[:user][:user_school_relations]
    @user = User.new(params[:user].delete_if  {|key| key == "user_school_relations" }.update(:role => select_role ))
    @user.password = @user.password_confirmation = :'123456'
    @contact = @user.build_contact_info

    if @user.save!
      [:email, :skype, :site, :phone].each do |contact_type|
        if params[contact_type].try(:[], :body).blank?
          @contact.send(contact_type.to_s.pluralize).create
        else
          redirect_to users_path
        end
      end
      create_user_school_relation(@user, school_id)
      UserMailer.notification_you_have_added(@user, @user.password).deliver
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private

  def create_user_school_relation(user, school_id)
    UserSchoolRelation.create(:user_id => @user.id || user.id, :school_id => params[:user][:user_school_relations] || school_id)
  end

  def get_school
    @schools = current_user.schools
  end

  def select_role
    params[:user][:role].present? ? params[:user][:role] : "pupil"
  end

  def find_a_user
    @user = User.find(params[:id])
  end

end
