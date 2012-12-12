class UsersController < ApplicationController

  before_filter :get_school, :only => [:edit, :new, :update]
  before_filter :find_a_user, :only => [:update, :edit, :show, :destroy, :create_user_school_relation]

  def index
    @users = User.select("users.*, CASE WHEN user_school_relations.id IS NULL THEN NULL ELSE TRUE END as school_relation")
      .joins(%Q{LEFT OUTER JOIN user_school_relations ON users.id = user_school_relations.user_id})
      .group("users.id, school_relation")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    create_user_school_relation if params[:user][:user_school_relations].present?
    respond_to do |format|
      if @user.update_attributes(params[:user].delete_if  {|key| key == "user_school_relations" })
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
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
