require 'spec_helper'

feature 'user signs in', %q{
  As a registered user
  I want to sign in to my account
  So I can have access to the features of the site
} do

  # I must specify a valid, previously registered password
  # I am authenticated and granted access to the website
  # If I specify an invalid email or password, I remain unauthenticated and not granted access to the site
  # If I am already signed in, I am not allowed to sign in again

  let(:user) { FactoryGirl.create(:user)}


  context "user logs in" do
    it "logs the user in" do
      visit root_path
      click_on "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"

      expect(page).to have_content("Signed in successfully")
    end
  end

  context "attempts to log in with invalid information" do

    it 'user enters invalid email' do
      visit root_path
      click_on "Login"
      fill_in "Email", with: "wrongemail"
      fill_in "Password", with: user.password
      click_button "Sign in"

      expect(page).to have_content("Invalid email")
    end

    it 'user enters invalid password' do
      visit root_path
      click_on "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: "wrong password"
      click_button "Sign in"

      expect(page).to have_content("Invalid password")
    end
  end
end
