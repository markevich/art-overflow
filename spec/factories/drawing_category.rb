FactoryGirl.define do
  factory :drawing_category do
    sequence(:name) { |n| "L1 #{n}"}
  end
end