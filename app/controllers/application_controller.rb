class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :role, :git_username, {cohort_ids: []}, {location_ids: []}) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :current_password, :role, :git_username, {cohort_ids: []}, {location_ids: []}) }
  end

  def after_sign_in_path_for resource
    root_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
     policy_name = exception.policy.class.to_s.underscore
     p policy_name
     p exception.query
     flash[:alert] = I18n.t "pundit.#{policy_name}.#{exception.query}",
       default: 'You cannot perform this action.'
     redirect_to(request.referrer || root_path)
     
  end

end
