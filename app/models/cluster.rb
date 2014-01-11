class Cluster < ActiveRecord::Base
  has_many :asteroid_fields,
    inverse_of: :cluster
  has_many :planets,
    inverse_of: :cluster
  has_many :moons,
    inverse_of: :cluster
  belongs_to :system,
    inverse_of: :clusters

  validates_presence_of :name
  validates_presence_of :system
end
