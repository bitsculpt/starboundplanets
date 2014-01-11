# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cluster do
    sequence :name do |n|
      "Alpha Beta Centauri #{n}"
    end

    association :system
  end
end
