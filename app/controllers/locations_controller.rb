class LocationsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.create location_params
    if @location.save == true
      redirect_to root_path
      flash[:success] = "Location successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @location.update_attributes location_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    authorize @location
    @location.destroy
    redirect_to root_path
  end

  private

  def find_location
    @location = Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(:city, :state, :description, {course_ids: []})
  end

end
