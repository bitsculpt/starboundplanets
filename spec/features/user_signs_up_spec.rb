require 'spec_helper'

feature 'user signs up', %q{
  As a site visitor
  I want to create an account
  so I can access the features of the website.
} do

# A visitor must provide a valid and unique username and email
# A vistor must provide a valid password and password confirmation

  context "user signs up with valid information" do

    it "should create a new user" do
      visit root_path
      click_on "Sign Up"
      fill_in 'Username', with: 'Starboundy'
      fill_in 'Email', with: 'dave@example.com'
      fill_in 'Password', with: 'mypassword', exact: true
      fill_in 'Password confirmation', with: 'mypassword', exact: true
      click_on 'Sign up'

      expect(page).to have_content("You have signed up successfully")
      expect(page).to_not have_content("can't be blank")
      expect(page).to have_content("Logout")
    end
  end

  context 'valid or required information is not supplied' do

    it "should give an error if fields are blank" do
      visit root_path
      click_on 'Sign Up'
      click_on 'Sign up'

      expect(page).to_not have_content("You have signed up successfully")
      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content("Logout")
    end

    it 'should give an error if Username is not unique' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign Up'
      fill_in  'Username', with: user.username
      fill_in 'Email', with: 'mail@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_on 'Sign up'
      expect(page).to have_content("Username has already been taken")
    end

    it 'should give an error if Email is not unique' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign Up'
      fill_in 'Email', with: user.email
      fill_in 'Username', with: "Name"
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_on 'Sign up'
      expect(page).to have_content("Email has already been taken")
    end


    it 'should give an error if password confirmation does not match initial password' do
      visit root_path
      click_on 'Sign Up'
      fill_in 'Username', with: "Name"
      fill_in 'Email', with: 'bob@example.com'
      fill_in 'Password', with: 'mypassword', exact: true
      fill_in 'Password confirmation', with: 'differentpassword', exact: true

      click_on 'Sign up'
      expect(page).to_not have_content("You have signed up successfully")
      expect(page).to have_content("Password confirmation doesn't match")
    end
  end
end
