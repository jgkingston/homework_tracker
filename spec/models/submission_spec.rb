require 'rails_helper'

describe Submission do

  let!(:submission) { build(:submission) }

  it 'instantiates an submission' do
    expect(submission.class.name).to eq("Submission")
    expect(submission.user.class.name).to eq("User")
    puts submission.user.full_name
    puts submission.user.id
  end

end