# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planet do
    biome "MyString"
    threat_level 1
    cluster_id 1
    description "MyText"
    username "MyString"
  end
end
