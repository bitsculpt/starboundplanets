class Planet < ActiveRecord::Base
  belongs_to :cluster
  validates_presence_of :biome
  validates_presence_of :threat_level
  validates_presence_of :cluster

end
