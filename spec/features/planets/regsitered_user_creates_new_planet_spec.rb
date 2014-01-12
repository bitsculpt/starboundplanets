require 'spec_helper'

feature "User creates a planet", %q{
  As a User
  I want to add a planet
  So that I can share it
} do

  #   Acceptance Criteria:
  # * I can add a new planet from the cluster page
  # * I must specify biome and threat level
  # * I can optionally specify a description
  # * If I specify all information the planet is added
  # * If I specify invalid information I get an error

  let(:user) { FactoryGirl.create( :user ) }
  let!(:sector) { FactoryGirl.create(:sector) }
  let!(:system) { FactoryGirl.create(:system, sector: sector) }
  let!(:cluster) { FactoryGirl.create(:cluster, system: system) }

  before :each do
    sign_in_as(user)
  end

  context "User supplies valid information" do

    it "should create a new planet with description" do
      visit cluster_path(cluster)
      click_on "Create Planet"

      select 'Desert', from: 'Biome'
      select '1', from: 'Threat level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Planet"

      expect(page).to have_content("Cool! You created a planet!")
    end

    it "should create a new planet without description" do
      visit cluster_path(cluster)
      click_on "Create Planet"

      select 'Desert', from: 'Biome'
      select '1', from: 'Threat level'
      click_on "Create Planet"

      expect(page).to have_content("Cool! You created a planet!")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if biome field is blank" do
      visit cluster_path(cluster)
      click_on "Create Planet"

      select '1', from: 'Threat level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Planet"

      expect(page).to have_content("Biome can't be blank")
    end

    it "should give an error if threat level field is blank" do
      visit cluster_path(cluster)
      click_on "Create Planet"

      select 'Desert', from: 'Biome'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Planet"

      expect(page).to have_content("Threat level can't be blank")
    end

    it "should not allow a second planet for a cluster" do
      FactoryGirl.create(:planet, cluster: cluster)
      visit cluster_path(cluster)

      expect(page).to_not have_content("Create Planet")
    end

  end

end
