require 'spec_helper'

describe Sector do
  it { should validate_presence_of :name }

  it { should have_many(:systems) }
  it { should have_many(:clusters).through(:systems) }
  it { should have_many(:planets).through(:systems) }
  it { should have_many(:moons).through(:systems) }
  it { should have_many(:asteroid_fields).through(:systems) }
end
