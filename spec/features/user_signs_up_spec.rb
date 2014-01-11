require 'rspec_helper'

feature 'user signs up', %q{ 
  As a site visitor
  I want to create an account
  so I can access the features of the website.
}

# A visitor must provide a valid and unique username and email
# A vistor must provide a valid password and password confirmation

scenario "user signs up with valid information" do 
  visit root_path
  click on "Sign up"
  fill_in 'Username', with: 'Starboundy'
  fill_in 'Email', with: 'dave@example.com'
  fill_in 'Password', with: 'mypassword', exact: true
  fill_in 'Password Confirmation', with: 'mypassword', exact: true
  click_button 'Sign Up'
  
  expect(page).to have_content("You have signed up successfully")
  expect(page).to_not have_content("can't be blank")
  expect(page).to have_content("Logout")
end

scenario 'valid or required information is not supplied' do

  it "should give an error if fields are blank" do
    visit root_path
    click_on 'Sign Up'
    click_button 'Sign Up'

    expect(page).to_not have_content("You have signed up successfully")
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Logout")
  end

  it 'should give an error if Username is not unique'
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign up'
    fill_in  'username', with: user.username
    expect(page).to have_content("username already exists")
  end

it 'should give an error if Email is not unique'
  user = FactoryGirl.create(:user)
  visit root_path
  click_on 'Sign up'
  fill_in 'email', with: user.email
end


it 'should give an error if password confirmation does not match initial password' do
  visit root_path
  click_on 'Sign Up'
  fill_in 'First Name', with: 'Bob'
  fill_in 'Last Name', with: 'Smith'
  fill_in 'Email', with: 'bob@example.com'
  fill_in 'Password', with: 'mypassword', exact: true
  fill_in 'Password Confirmation', with: 'differentpassword', exact: true

  click_button 'Sign Up'
  expect(page).to_not have_content("You have signed up successfully")
  expect(page).to have_content("Password confirmation does not match")
end