require 'rails_helper'

describe "submit homework", type: :feature, js: true do

  let!(:location) { create(:location) }
  let!(:course) { create(:course) }
  let!(:cohort) { create(:cohort, location: location, course: course) }
  let!(:assignment) { create(:assignment, cohort: cohort) }
  let!(:student) { create(:student) }
  let!(:contract) { create(:contract, user: student, cohort: assignment.cohort) }

  # This seems cleaner and uses associations but it does not work ... yet
  # let!(:assignment) { build(:assignment) }
  # let!(:student) { build(:student) }
  # let!(:contract) { create(:contract, user: student, cohort: assignment.cohort) }

  it "should allow user a student user to log in, navigate to assignment page and submit homework" do

    visit '/'
    fill_in "Email", with: "#{student.email}"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Student")

    click_link "Charleston"
    expect(page).to have_content("Assignment")

    click_link "Homework Tracker"
    expect(page).to have_content("Submissions")

    click_link "Submit"

    fill_in "Name", with: "My Homework"
    fill_in "Notes", with: "It was hard."
    click_button "Create Submission"

    expect(page).to have_content("#{student.email}")


  end

end