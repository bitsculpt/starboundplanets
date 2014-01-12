# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asteroid_field do
    name "Thoridon Celsiuc Klingon a"
    threat_level 1
    description "MyText"
    username "MyString"

    association :cluster
  end
end
