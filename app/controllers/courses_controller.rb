class CoursesController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :find_course,  only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    if @course.save == true
      redirect_to root_path
      flash[:success] = "Course successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @course.update_attributes course_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path
  end

  private

  def find_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:title, :description, {location_ids: []})
  end

end
