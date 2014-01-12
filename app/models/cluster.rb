class Cluster < ActiveRecord::Base
  has_one :asteroid_field,
    inverse_of: :cluster
  has_one :planet,
    inverse_of: :cluster
  has_many :moons,
    inverse_of: :cluster
  belongs_to :system,
    inverse_of: :clusters

  validates_presence_of :name
  validates_presence_of :system

  validates_uniqueness_of :name
end
