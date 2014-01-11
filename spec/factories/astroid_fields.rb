# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :astroid_field do
    name "MyString"
    cluster_id 1
    threat_level 1
    description "MyText"
    username "MyString"
  end
end
