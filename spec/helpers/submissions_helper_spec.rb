require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SubmissionsHelper. For example:
#
# describe SubmissionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SubmissionsHelper, :type => :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject do
    Submission.new ({
      title: "Here be my homework",
      notes: "It was hard",
      user_id: 3,
      repo: "homework_1",          
      workflow_state: "new"
      })
  end

  it "should return a hash of available workflow state key, value pairs depending on the submission objects current state" do
    expect(helper.available_states(subject)).to eq({review: "Review"})
  end
end
