# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    user_id 1
    planet_id 1
    score 1
  end
end
