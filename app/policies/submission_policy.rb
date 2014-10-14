class SubmissionPolicy < ApplicationPolicy
  
  attr_reader :current_user, :model

  def initialize current_user, model
    @current_user = current_user
    @submission = model
  end

  def create?
    puts "checked user role"
    @current_user.student?
  end

  def update?
    @current_user.student?
  end

  def destroy?
    @current_user.student?
  end



  class Scope < Scope

    def resolve
      if user.instructor? || user.admin? || user.ta?
        puts "I am the master"
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end

  end

end