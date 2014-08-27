module SubmissionsHelper

  def user_has_submitted? assignment
    @submission = Submission.find_by_user_id_and_assignment_id(current_user.id, assignment.id)
  end

  def available_states submission

    @workflow_states = Hash.new

    case submission.workflow_state

    when 'new'
      @workflow_states[:review] = "Review"
    when 'reviewing'
      @workflow_states[:return] = "Return"
      @workflow_states[:accept] = "Accept"
    when 'complete'

    when 'incomplete'
      @workflow_states[:review] = "Review"
      @workflow_states[:accept] = "Accept"
    end
    
    @workflow_states

  end

end
