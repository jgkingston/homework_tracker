class LocationsController < ApplicationController

  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
    
  end

  private

  def find_location
    @location = Location.find params[:id]
  end

end
