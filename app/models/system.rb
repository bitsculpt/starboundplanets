class System < ActiveRecord::Base
  belongs_to :sector,
    inverse_of: :systems
  has_many :clusters,
    inverse_of: :system
  has_many :planets,
    through: :clusters
  has_many :moons,
    through: :clusters
  has_many :asteroid_fields,
    through: :clusters

  validates_presence_of :name
  validates_presence_of :x_coord
  validates_presence_of :y_coord
  validates_presence_of :sector
end
