class AsteroidField < ActiveRecord::Base
  belongs_to :cluster,
    inverse_of: :asteroid_field

  validates_presence_of :name
  validates_presence_of :threat_level
  validates_presence_of :cluster
end
