class NotificationMailer < ActionMailer::Base
  default from: 'irontracker@theironyard.com'

  def assignment_notification assignment, user, content
    @user = user
    @assignment = assignment
    @content = content
    # @url  = 'http://example.com/login'
    mail(to: assignment.cohort.users.map(&:email), subject: "#{user.email} has commented on #{assignment.summary}")
  end

  def submission_notification submission, user, content
    @user = user
    @submission = submission
    @content = content
    if user.instructor?
      mail(to: submission.user.email, subject: "#{user.email} has commented on #{submission.title}")
    elsif user.student?
      mail(to: submission.cohort.users.where(:role => 'instructor').map(&:email), subject: "#{user.email} has a question about #{submission.assignment.summary}")
    end
  end

end
