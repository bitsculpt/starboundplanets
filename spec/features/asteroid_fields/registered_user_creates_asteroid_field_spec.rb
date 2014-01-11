require 'spec_helper'

feature "User creates an asteroid field", %q{
  As a User
  I want to add an asteroid field
  So that I can share it
} do

  #   Acceptance Criteria:
  # * I can add a new asteroid field from the cluster page
  # * I must specify name and threat level
  # * I can optionally specify a description
  # * If I specify all information the asteroid field is added
  # * If I specify invalid information I get an error

  let(:user) { FactoryGirl.create( :user ) }
  let!(:sector) { FactoryGirl.create(:sector) }
  let!(:system) { FactoryGirl.create(:system, sector: sector) }
  let!(:cluster) { FactoryGirl.create(:cluster, system: system) }

  before :each do
    sign_in_as(user)
  end

  context "User supplies valid information" do

    it "should create a new asteroid field with description" do
      visit cluster_path(cluster)
      click_on "Create Asteroid Field"

      fill_in "Name", with: "Hemmer Oid"
      select '1', from: 'Threat Level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Asteroid Field"

      expect(page).to have_content("Asteroid field successfully created.")
      visit cluster_path(cluster)
      expect(page).to have_content("Description: Best avian base ever!")
    end

    it "should create a new asteroid field without description" do
      visit cluster_path(cluster)
      click_on "Create Asteroid Field"

      fill_in "Name", with: "Hemmer Oid"
      select '1', from: 'Threat Level'
      click_on "Create Asteroid Field"

      expect(page).to have_content("Asteroid field successfully created.")
      visit cluster_path(cluster)
      expect(page).to have_content("Description: None")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if threat level field is blank" do
      visit cluster_path(cluster)
      click_on "Create Asteroid Field"

      fill_in "Name", with: "Hemmer Oid"
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Asteroid Field"

      expect(page).to have_content("Threat level can't be blank.")
    end

    it "should give an error if name field is blank" do
      visit cluster_path(cluster)
      click_on "Create Asteroid Field"

      select '1', from: 'Threat Level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Asteroid Field"

      expect(page).to have_content("Name can't be blank.")
    end

    it "should not allow a second asteroid field for a cluster" do
      FactoryGirl.create(:asteroid_field, cluster: cluster)
      visit cluster_path(cluster)

      expect(page).to_not have_content("Create Asteroid Field")
    end

  end

end
