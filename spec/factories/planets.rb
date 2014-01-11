# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planet do
    biome "Desert"
    threat_level 1
    description "4VI4NS!!!"
    username "Wiz4rd"

    association :cluster
  end
end
