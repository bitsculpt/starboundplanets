class Planet < ActiveRecord::Base
  belongs_to :cluster,
    inverse_of: :planet
belongs_to :user 
  validates_presence_of :biome
  validates_presence_of :threat_level
  validates_presence_of :cluster

  def full_name
    cluster.system.sector.name + " " + cluster.system.name + " " + cluster.name + " " + name
  end

end
