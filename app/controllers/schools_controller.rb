class SchoolsController < ApplicationController
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
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render json: @school, status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end
end
