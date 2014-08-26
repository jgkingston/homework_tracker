class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      if user.instructor?
        puts "I am the teacher"
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end

  end

end