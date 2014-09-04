
FactoryGirl.define do

  sequence :email do |n|
    "student#{n}@student.com"
  end

  factory :student, class: User do
    first_name "Student"
    last_name  "User"
    email
    password "password"
    password_confirmation "password"
  end

  factory :contract do
    cohort
    association :user, factory: :student
  end

  factory :instructor, class: User do
    first_name "Teacher"
    last_name "User"
    email "instructor@instructor.com"
    password "password"
    password_confirmation "password"
    role 2
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    email "admin@admin.com"
    password "password"
    password_confirmation "password"
    role 3
  end

  factory :location do
    city "Charleston"
    state "SC"
    blurb "It's in Charleston, SC"
    courses []
  end

  factory :course do
    title "Rails Engineering"
    description "Magic!"
  end

  factory :offering do
    location
    course
  end

  factory :cohort do
    start_date "12/07/2014"
    location FactoryGirl.create(:location)
    course FactoryGirl.create(:course)
    git_username "TIY-Q3-ROR-CHS"
  end

  factory :assignment do
    summary "Homework Tracker"
    instructions "It should track homework."
    cohort FactoryGirl.create(:cohort)
    repo "homework_tracker"
    due_date "23/07/2014"

    factory :assignment_with_submissions do

      ignore do
        submissions_count 5
      end

      after(:create) do |assignment, evaluator|
        create_list(:submission, evaluator.submissions_count, assignment: assignment)
      end
    end
  end

  factory :submission do
    title "My Homework"
    notes "It is awesome!"     
    workflow_state "new"

    assignment
    association :user, factory: :student
  end

end