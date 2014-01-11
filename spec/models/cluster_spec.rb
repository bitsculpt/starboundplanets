require 'spec_helper'

describe Cluster do
  it { should validate_presence_of :name }
  it { should validate_presence_of :system }

  it { should have_one :planet }
  it { should have_many :moons }
  it { should have_one :asteroid_field }
  it { should belong_to :system }

  # it { should validate_uniqueness_of(:name) }
end
