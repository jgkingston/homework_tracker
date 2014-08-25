module SubmissionsHelper

  def user_has_submitted? assignment
    @submission = Submission.find_by_user_id_and_assignment_id(current_user.id, assignment.id)
  end

end
