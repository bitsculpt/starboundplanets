class Sector < ActiveRecord::Base
  has_many :systems,
    inverse_of: :sector
  has_many :clusters,
    through: :systems
  has_many :planets,
    through: :systems
 
  

  validates_presence_of :name
end
