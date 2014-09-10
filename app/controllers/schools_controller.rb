class SchoolsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_filter :find_school, only: [:show, :edit, :update]

  def index
    @search = if params[:user_id].present?
                 @search = Sunspot.search(User.find(params[:user_id]).schools) do
                   fulltext params[:search]
                 end
              else
                @search = Sunspot.search(School) do
                  fulltext params[:search]
                  paginate :page => 1, :per_page => 5
                end
              end

    @schools = @search.results
  end

  def new
    @school = School.new
  end

  def show
    @user = @school.creator
  end

  def edit
  end

  def create
    @school = School.new( school_params.merge( creator_id: params[:user_id] ) )
    if @school.save
      UserSchoolRelation.create( member_id: params[:user_id], school_id: @school.id, role: 'admin' )
      redirect_to user_school_path( id: @school ), notice: 'School saved successfully!'
    else
      render action: 'new'
    end
  end

  def update
      if @school.update(school_params)
        redirect_to user_school_path( params[:user_id], @school.id ), action: :show
      else
        render action: 'edit'
      end
  end

  def destroy
    school = School.where( creator_id: params[:user_id], id: params[:id] ).first
    school.destroy
    render action: 'index'
  end

  private

  def find_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:date_of_foundation, :info, :name, :status, :creator_id, :contact_info_attributes)
  end

end
