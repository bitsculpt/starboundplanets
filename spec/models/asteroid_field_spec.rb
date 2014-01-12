require 'spec_helper'

describe AsteroidField do
  let(:blank) { [nil, ""] }

  it { should belong_to(:cluster) }


  it { should have_valid(:name).when("biome example") }
  it { should_not have_valid(:name).when(*blank) }

  it { should have_valid(:threat_level).when(3) }
  it { should_not have_valid(:threat_level).when(*blank) }
end


