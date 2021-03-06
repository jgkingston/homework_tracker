require 'rails_helper'

describe "the sign in process", type: :feature, js: true do

  it "should allow user registration" do
    visit '/'
    click_link 'Register'
    fill_in "Last name", with: "Smith"
    fill_in "First name", with: "John"
    fill_in "#registration-email", with: "john@smith.com"
    fill_in "#registration-password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Register"
    expect(page).to have_content("Welcome!")
  end

end
