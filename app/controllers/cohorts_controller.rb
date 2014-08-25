class CohortsController < ApplicationController

  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  before_action :find_location

  def show
    
  end

  private

  def find_cohort
    @cohort = Cohort.find params[:id]
  end

  def find_location
    @locaiton = Location.find params[:location_id]
  end

end
