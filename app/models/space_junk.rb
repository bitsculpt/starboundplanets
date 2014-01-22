class SpaceJunk
  def self.biomes
    ['Arid','Barren','Desert','Forest','Grassland','Jungle','Magma','Moon','Snow','Tundra','Volcano','Asteroid Field', 'Moon']
  end

  def self.threat_levels
    (1..10).to_a
  end

  def self.planet_names
    ('a'..'z').to_a
  end

  def self.orbit_names
    ['I','II','III','IV','V',
     'VI','VII','VIII','IX','X',
     'XI','XII','XIII','XIV','XV',
     'XVI','XVII','XVIII','XIX','XX']
  end

  def self.tags
    ['Avian Dungeon','Apex Dungeon','Avian Village','Apex Village','No Air','Low Gravity','Clear','Rain','Snow',
     'Acid Rain','Meteor Shower','Sparkle Shower','Crypt','Flying Airship','Hi-Tech Chest','Human Village',
     'Floran Village','Hylotl Village','Glitch']
  end

end
