require 'rails_helper'

RSpec.describe AssignmentWithSubmissions, :type => :assignment do

  let!(:assignment_with_submissions) { create(:assignment_with_submissions)}

  it "should return the first submission object with a matching user_id" do
    expect(assignment_with_submissions.student_submission(3).title).to eq("My Homework")
  end

  it "should return an array of submissions with matching workflow states" do
    expect(assignment_with_submissions.submissions_with_status('new').length).to eq(5)
  end

end