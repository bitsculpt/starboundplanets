class Sector < ActiveRecord::Base
  has_many :planets,
    inverse_of: :sector

  validates_presence_of :name
end
