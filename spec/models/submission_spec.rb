require 'rails_helper'

describe Submission do

  let!(:submission) { build(:submission) }

  it 'instantiates an submission' do
    expect(submission.class.name).to eq("Submission")
    expect(submission.user.class.name).to eq("User")
    expect(submission.assignment.class.name).to eq("Assignment")
    expect(submission.assignment.cohort.class.name).to eq("Cohort")
    puts submission.assignment.summary
    puts submission.assignment.cohort.start_date
  end

end