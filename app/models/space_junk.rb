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
end
