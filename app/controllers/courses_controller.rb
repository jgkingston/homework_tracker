class CoursesController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :find_course,  only: [:show, :edit, :update, :destroy]

  def show
    
  end

  private

  def find_course
    @course = Course.find params[:id]
  end

end
