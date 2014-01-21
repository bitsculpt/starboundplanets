class Rating < ActiveRecord::Base
  belongs_to :planet
  belongs_to :user

  validates_inclusion_of :score, in: [1,-1]
end
