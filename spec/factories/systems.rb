# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :system do
    name "MyString"
    x_coord 1
    y_coord 1
    sector_id 1
  end
end
