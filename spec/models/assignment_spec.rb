require 'rails_helper'

describe Assignment do

  let!(:assignment) { build(:assignment) }

  it 'instantiates an assignment' do
    expect(assignment.class.name).to eq("Assignment")
    expect(assignment.cohort.class.name).to eq("Cohort")
    expect(assignment.cohort.location.class.name).to eq("Location")
    expect(assignment.cohort.course.class.name).to eq("Course")
  end

end

describe Assignment do

  let!(:assignment_with_submissions) { create(:assignment_with_submissions) }


  it "should return the first submission object with a matching user_id" do
    puts assignment_with_submissions.submissions.length
    expect(assignment_with_submissions.student_submission(3).title).to eq("My Homework")
  end

  it "should return an array of submissions with matching workflow states" do
    expect(assignment_with_submissions.submissions_with_status('new').length).to eq(5)
  end

end
