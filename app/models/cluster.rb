class Cluster < ActiveRecord::Base
  has_many :planet,
    inverse_of: :cluster
  
  belongs_to :system,
    inverse_of: :clusters

  validates_presence_of :name
  validates_presence_of :system

end
