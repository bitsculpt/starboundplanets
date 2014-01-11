class AstroidField < ActiveRecord::Base
  belongs_to :cluster
  validates_presence_of :name
  validates_presence_of :threat_level
  validates_presence_of :cluster

end
