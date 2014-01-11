require 'spec_helper'

describe Planet do

  let(:blank) { [nil, ""] }

  it { should belong_to(:cluster) }


  it { should have_valid(:biome).when("biome example") }
  it { should_not have_valid(:biome).when(*blank) }

  it { should have_valid(:threat_level).when(3) }
  it { should_not have_valid(:threat_level).when(*blank) }

  # it { should have_valid(:description).when("description example") }
  # it { should_not have_valid(:description).when(*blank) }

  # it { should have_valid(:username).when("badassplaya!") }
  # it { should_not have_valid(:username).when(*blank) }



end


