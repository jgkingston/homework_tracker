class CommentsController < ApplicationController

  def create
    @comment = Comment.create comment_params

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully added.' }
        # format.json { render :show, status: :created, location: @group }
        format.js
        if @comment.commentable_type == "Submission"
          @submission = Submission.find(@comment.commentable_id)
          NotificationMailer.submission_notification(@submission, current_user, @comment.content).deliver
        elsif @comment.commentable_type == "Assignment"
          @assignment = Assignment.find(@comment.commentable_id)
          NotificationMailer.assignment_notification(@assignment, current_user, @comment.content).deliver
        end
      else
        format.html { render :show }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
  end

end
