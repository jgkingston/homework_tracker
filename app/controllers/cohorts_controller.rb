class CohortsController < ApplicationController

  before_action :find_location
  before_action :find_cohort, only: [:show, :edit, :update, :destroy, :submission_status, :dashboard]

  def index
    @cohorts = Cohort.all
  end

  def show
   
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.create cohort_params
    if @cohort.save == true
      redirect_to root_path
      flash[:success] = "Cohort successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @cohort.update_attributes cohort_params
      redirect_to root_path
      flash[:success] = "Cohort successfully modified."
    else
      render :edit
    end
  end

  def destroy
    @cohort.destroy
    redirect_to root_path
  end

  def submission_status
    @assignment = Assignment.find params[:q]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def dashboard
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def find_cohort
    @cohort = Cohort.find params[:id]
  end

  def find_location
    @location = Location.find params[:location_id]
  end

  def cohort_params
    params.require(:cohort).permit(:start_date, :location_id, :course_id)
  end

end
