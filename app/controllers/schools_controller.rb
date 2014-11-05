class SchoolsController < ApplicationController
  helper_method :sort_column

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_filter :find_school, only: [:show, :edit, :update]

  def index
    @search = if params[:user_id].present?
                School.solr_search do
                   with(:creator_id, params[:user_id])
                   fulltext params[:search]
                   facet (:name)
                end
              else
                  School.solr_search do
                  fulltext params[:search]
                  facet (:name)
                  facet (:the_number_of_members)
                  facet (:status)
                  order_by sort_column , sort_direction
                  paginate page: params[:page] || 1, per_page: 5
                end
              end
    @schools = @search.results
    add_breadcrumb 'schools', schools_path
  end

  def new
    @school = School.new
  end

  def show
    @user = @school.creator
    add_breadcrumb 'show', school_path(@school)
    add_breadcrumb @school.name
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

  def sort_column
    columns = School.column_names.map(&:to_sym)
    sort = params[:sort].present? ? params[:sort].to_sym : :name
    columns.push(:the_number_of_members).include?(sort) ? sort : :name
  end

  def current_creator
    User.find(params[:user_id])
  end

end
