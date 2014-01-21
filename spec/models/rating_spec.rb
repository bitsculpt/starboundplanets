require 'spec_helper'

describe Rating do
  it { should have_valid(:score).when(1,-1) }
  it { should_not have_valid(:score).when(0,5,-90) }
end
