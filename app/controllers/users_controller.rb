class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :get_school, :only => [:edit, :new, :update]
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
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

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def add_user

    @user = User.new(params[:user])
    @user.password = @user.password_confirmation = :'123456'
    @contact = @user.build_contact_info

    if @user.save
      [:email, :skype, :site, :phone].each do |contact_type|
        if params[contact_type].try(:[], :body).blank?
          @contact.send(contact_type.to_s.pluralize).create
        else
          redirect_to users_path
          #params[contact_type][:body].split(',').each do |elem|
          #  resource.contact_infos.send(contact_type).create(:body => elem)
          #end
        end
      end
    UserMailer.notification_you_have_added(@user, @user.password).deliver
    redirect_to users_path
    end
  end

  def new_user
    @user = User.new
  end

  private

  def get_school
    @schools = School.all
  end
end
