class Moon < ActiveRecord::Base
  belongs_to :cluster,
    inverse_of: :moons

  validates_presence_of :name
  validates_presence_of :biome
  validates_presence_of :threat_level
  validates_presence_of :cluster
  validates_uniqueness_of :name
end
