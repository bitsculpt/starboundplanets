require 'spec_helper'

describe Cluster do
  it { should validate_presence_of :name }
  it { should validate_presence_of :system }

  it { should have_many :planets }
  it { should have_many :moons }
  it { should have_many :asteroid_fields }
  it { should belong_to :system }
end
