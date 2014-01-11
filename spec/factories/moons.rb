# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :moon do
    name "MyString"
    cluster_id 1
    biome "MyString"
    threat_level 1
    username "MyString"
    description "MyText"
  end
end
