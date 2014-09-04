require 'rails_helper'

describe "user login", type: :feature, js: true do

  let!(:student) { create(:student) }

  it "should allow user a student user to log in" do

    visit '/'
    fill_in "Email", with: "#{student.email}"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Student")

  end

end