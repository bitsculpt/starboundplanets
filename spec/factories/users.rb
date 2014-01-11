# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "badassplaya!#{n}"
    end

    sequence :email do |n|
      "badass#{n}@playa.com"
    end

    password "letsplay"
  end
end