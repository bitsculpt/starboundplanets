require 'spec_helper'

feature "User creates a system" %q{
  As a User
  I want to add a system
  So that clusters can be added to it
} do

  #   Acceptance Criteria:
  # * I can add a new system from the sector page
  # * I have to specify name, x coordinate, and y coordinate
  # * If I specify all information the system is added
  # * If I specify invalid information I get an error

  let(:user) { FactoryGirl.create( :user ) }
  let!(:sector) { FactoryGirl.create(:sector) }

  before :each do
    sign_in_as(user)
  end

  context "User supplies valid information" do

    it "should create a new system" do
      visit sector_path(sector)
      click_on "New System"

      fill_in "Name", with: "Alpha Alice 939"
      fill_in "X coord", with: "-79043854"
      fill_in "y coord", with: "82579000"
      click_on "Create System"

      visit sector_path(sector)
      expect(page).to have_content("Alpha Alice 939")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if any field is blank" do
      visit sector_path(sector)
      click_on "New System"

      click_on "Create System"

      expect(page).to have_content("Name can't be blank.")
      expect(page).to have_content("X coord can't be blank.")
      expect(page).to have_content("Y coord can't be blank.")
    end

    it "should give an error if x coord is not a number" do
      visit sector_path(sector)
      click_on "New System"

      fill_in "Name", with: "Alpha Alice 939"
      fill_in "X coord", with: "HELLO!"
      fill_in "y coord", with: "82579000"
      click_on "Create System"

      expect(page).to have_content("X coord must be a number.")
    end

    it "should give an error if y coord is not a number" do
      visit sector_path(sector)
      click_on "New System"

      fill_in "Name", with: "Alpha Alice 939"
      fill_in "X coord", with: "-79043854"
      fill_in "y coord", with: "HELLO!"
      click_on "Create System"

      expect(page).to have_content("Y coord must be a number.")
    end

    it "should give an error if system name already exists" do
      system = FactoryGirl.create(:system, sector: sector)

      visit sector_path(sector)
      click_on "New System"

      fill_in "Name", with: system.name
      fill_in "X coord", with: "-79043854"
      fill_in "y coord", with: "82579000"
      click_on "Create System"

      expect(page).to have_content("#{system.name} already exists.")
    end

    it "should give an error if system coordinates already exist" do
      system = FactoryGirl.create(:system, sector: sector)

      visit sector_path(sector)
      click_on "New System"

      fill_in "Name", with: "Super Awesome Secret Avian Base Wielding Planets Reside Here"
      fill_in "X coord", with: system.x_coord
      fill_in "y coord", with: system.y_coord
      click_on "Create System"

      expect(page).to have_content("Those coordinates already exist.")
    end

  end

end
