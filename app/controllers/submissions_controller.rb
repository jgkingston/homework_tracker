class SubmissionsController < ApplicationController

  before_action :find_assignment
  before_action :find_submission, only: [:show, :edit, :update, :destroy, :grade]

  def index
    @submissions = Submission.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create submission_params
    if @submission.save == true
      redirect_to assignment_path(@assignment)
      flash[:success] = "Assignment successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @submission.update_attributes submission_params
      redirect_to assignment_submission_path(@assignment, @submission)
    else
      render :edit
    end
  end

  def destroy
    @submission.destroy
    redirect_to assignment_path(@assignment)
  end

  def grade
    event = params[:event]+'!'
    @submission.send(event.to_sym)
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def find_assignment
    @assignment = Assignment.find params[:assignment_id]
  end

  def find_submission
    @submission = Submission.find params[:id]
  end

  def submission_params
    params.require(:submission).permit(:title, :notes, :assignment_id, :user_id, :workflow_state, links_attributes: [:id, :path, :submission_id, :_destroy])
  end

end
