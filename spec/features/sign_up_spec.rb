require 'spec_helper'

describe "the sign up process" do
  before :each do
    Teacher.new(first_name: "Nic", last_name: "Lombardi", email: "nic.lombardi916@gmail.com",
              password: "nics password", password_confirmation: "nics password")
  end

  it "can render the sign up page" do
    visit '/teachers/sign_up'
    expect(page).to have_content('Sign up')
  end

  it "redirects to the sign up page if no user is logged in" do
    visit '/teachers'
    expect(page).to have_content('Sign up')
  end

  it "does not sign in an invalid teacher" do
    visit '/teachers'
    fill_in('Email', with: "wrongemail@no.com")
    fill_in("Password", with: "secure password")
    click_button("Log in")
    within("p") do
      expect(page).to have_content("Invalid email or password")
    end
  end
end
