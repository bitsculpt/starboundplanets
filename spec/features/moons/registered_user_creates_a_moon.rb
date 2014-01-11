require 'spec_helper'

feature "User creates a moon", %q{
  As a User
  I want to add a moon
  So that I can share it
} do

  #   Acceptance Criteria:
  # * I can add a new moon from the cluster page
  # * I must specify name, biome, and threat level
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

    it "should create a new moon with description" do
      visit cluster_path(cluster)
      click_on "New Moon"

      fill_in "Name", with: "George Foreman"
      select 'Desert', from: 'Biome'
      select '1', from: 'Threat Level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Moon"

      expect(page).to have_content("Moon successfully created.")
      visit cluster_path(cluster)
      expect(page).to have_content("Description: Best avian base ever!")
    end

    it "should create a new moon without description" do
      visit cluster_path(cluster)
      click_on "New Moon"

      fill_in "Name", with: "George Foreman"
      select 'Desert', from: 'Biome'
      select '1', from: 'Threat Level'
      click_on "Create Moon"

      expect(page).to have_content("Moon successfully created.")
      visit cluster_path(cluster)
      expect(page).to have_content("Description: None")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if biome field is blank" do
      visit cluster_path(cluster)
      click_on "New Moon"

      fill_in "Name", with: "George Foreman"
      select '1', from: 'Threat Level'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Moon"

      expect(page).to have_content("Biome can't be blank.")
    end

    it "should give an error if threat level field is blank" do
      visit cluster_path(cluster)
      click_on "New Moon"

      fill_in "Name", with: "George Foreman"
      select 'Desert', from: 'Biome'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Moon"

      expect(page).to have_content("Threat level can't be blank.")
    end

    it "should give an error if name field is blank" do
      visit cluster_path(cluster)
      click_on "New Moon"

      select '1', from: 'Threat Level'
      select 'Desert', from: 'Biome'
      fill_in 'Description', with: "Best avian base ever!"
      click_on "Create Moon"

      expect(page).to have_content("Nme can't be blank.")
    end


    it "should not allow a two moons with the same name" do
      moon = FactoryGirl.create(:moon, cluster: cluster)
      visit cluster_path(cluster)
      click_on "New Moon"

      fill_in "Name", with: moon.name
      select 'Desert', from: 'Biome'
      select '1', from: 'Threat Level'
      click_on "Create Moon"

      expect(page).to_not have_content("#{moon.name} already exists.")
    end

  end

end
