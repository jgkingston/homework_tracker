class UpdateRoleMailer < ActionMailer::Base
  default from: 'irontracker@theironyard.com'
  
  def role_change_notification admin, user
    @user = user
    @admin = admin
    mail(to: user.email, subject: "#{admin.full_name} has assigned you a new IronTracker user role")
  end
end
