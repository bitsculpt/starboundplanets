class Planet < ActiveRecord::Base
  belongs_to :sector,
    inverse_of: :planets
  belongs_to :user

  validates_presence_of :biome
  validates_presence_of :threat_level
  validates_presence_of :system
  validates_presence_of :orbit
  validates_presence_of :x_coord
  validates_presence_of :y_coord

  validates :x_coord, :numericality => {:only_integer => true}
  validates :y_coord, :numericality => {:only_integer => true}

  validates_inclusion_of :threat_level, in: 1..10

  has_many :ratings

  acts_as_taggable

  def average_score
    total_score = 0

    ratings.each do |rating|
      total_score += rating.score
    end

    total_score
  end

  def full_name
    "#{self.sector.name} #{system} #{orbit} #{name}"
  end


end
