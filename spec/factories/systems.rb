# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :system do
    sequence :name do |n|
      "Alpha Omega Centauri #{n}"
    end
    sequence :x_coord do |n|
      n
    end
    sequence :x_coord do |n|
      n
    end

    association :sector
  end
end
