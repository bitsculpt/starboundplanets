require 'spec_helper'

describe System do
  it { should validate_presence_of :name }
  it { should validate_presence_of :x_coord }
  it { should validate_presence_of :y_coord }
  it { should validate_presence_of :sector }

  it { should belong_to :sector }
  it { should have_many :clusters }
  it { should have_many(:planets).through(:clusters) }
  it { should have_many(:moons).through(:clusters) }
  it { should have_many(:asteroid_fields).through(:clusters) }

  # it { should validate_uniqueness_of :name }
  # it { should validate_uniqueness_of(:x_coord).scope(:x_coord, :y_coord) }
  # it { should validate_uniqueness_of(:y_coord).scope(:x_coord, :y_coord) }
end
