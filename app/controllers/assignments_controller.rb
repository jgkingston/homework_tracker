class AssignmentsController < ApplicationController

  before_action :find_assignment, only: [:show, :edit, :update, :destroy]

  def show
    @submissions = policy_scope(Submission).where(:assignment_id => @assignment.id)
    @comment = Comment.new
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create assignment_params
    if @assignment.save == true
      redirect_to location_cohort_path(@assignment.curriculum.cohort.location, @assignment.curriculum.cohort )
      flash[:success] = "Assignment successfully added."
    else
      render :new
    end
  end

  private

  def find_assignment
    @assignment = Assignment.find params[:id]
  end

  def assignment_params
    params.require(:assignment).permit(:summary, :instructions, :curriculum_id)
  end

end
