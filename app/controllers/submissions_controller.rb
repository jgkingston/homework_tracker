class SubmissionsController < ApplicationController

  before_action :find_assignment
  before_action :find_submission, only: [:show, :edit, :update, :destroy]


  def new
    @submission = Submission.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @submission = Submission.create submission_params
    if @submission.save == true
      redirect_to location_cohort_path(@assignment.curriculum.cohort.location, @assignment.curriculum.cohort )
      flash[:success] = "Assignment successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  private

  def find_assignment
    @assignment = Assignment.find params[:assignment_id]
  end

  def find_submission
    @submission = Submission.find params[:id]
  end

  def submission_params
    params.require(:submission).permit(:title, :notes, :assignment_id, :user_id, links_attributes: [:id, :path, :submission_id, :_destroy])
  end

end
