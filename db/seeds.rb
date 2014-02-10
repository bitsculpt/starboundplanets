# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sectors = ['Alpha', 'Beta', 'Gamma','Delta', 'X']

unless Sector.count == sectors.size
  sectors.each do |sector|
    Sector.create(name: sector)
  end
end