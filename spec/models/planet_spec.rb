require 'spec_helper'

describe Planet do

  let(:blank) { [nil, ""] }

  it { should belong_to(:sector) }

  it { should validate_presence_of :system }
  it { should validate_presence_of :orbit }
  it { should validate_presence_of :x_coord }
  it { should validate_presence_of :y_coord }

  it { should have_valid(:biome).when("biome example") }
  it { should_not have_valid(:biome).when(*blank) }

  it { should have_valid(:threat_level).when(3) }
  it { should_not have_valid(:threat_level).when(*blank) }

  it { should have_valid(:threat_level).when(*((1..10).to_a)) }
  it { should_not have_valid(:threat_level).when(0,11,-10,100) }
end


