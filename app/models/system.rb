class System < ActiveRecord::Base
  belongs_to :sector
  has_many :clusters
  has_many :planets

  
  
  validates_presence_of :name
  validates_presence_of :x_coord
  validates_presence_of :y_coord
  validates_presence_of :sector

  validates_uniqueness_of :name
  validates_uniqueness_of :x_coord, scope: [:x_coord, :y_coord]
  validates_uniqueness_of :y_coord, scope: [:x_coord, :y_coord]

  validates :x_coord, :numericality => {:only_integer => true}
  validates :y_coord, :numericality => {:only_integer => true}
end
