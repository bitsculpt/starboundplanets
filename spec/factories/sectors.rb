# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sector do
    sequence :name do |n|
      "Alpha(#{n})"
    end
  end
end
