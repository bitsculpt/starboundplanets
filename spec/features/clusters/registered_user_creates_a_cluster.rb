require 'spec_helper'

feature "User creates a cluster", %q{
  As a User
  I want to add a cluster
  So that planets, moons, and asteroid fields can be added to it
} do

  #   Acceptance Criteria:
  # * I can add a new cluster from the system page
  # * I have to specify a name
  # * If I specify all information the cluster is added
  # * If I specify invalid information I get an error

  let(:user) { FactoryGirl.create( :user ) }
  let!(:sector) { FactoryGirl.create(:sector) }
  let!(:system) { FactoryGirl.create(:system, sector: sector) }

  before :each do
    sign_in_as(user)
  end

  context "User supplies valid information" do

    it "should create a new cluster" do
      visit system_path(system)
      click_on "New Cluster"

      fill_in "Name", with: "Alpha Alice 939 III"
      click_on "Create Cluster"

      visit system_path(system)
      expect(page).to have_content("Alpha Alice 939 III")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if name field is blank" do
      visit system_path(system)
      click_on "New Cluster"

      click_on "Create Cluster"

      expect(page).to have_content("Name can't be blank.")
    end

    it "should give an error if cluster name already exists" do
      cluster = FactoryGirl.create(:cluster, system: system)

      visit system_path(system)
      click_on "New Cluster"

      fill_in "Name", with: cluster.name
      click_on "Create Cluster"

      expect(page).to have_content("#{cluster.name} already exists.")
    end

  end

end
