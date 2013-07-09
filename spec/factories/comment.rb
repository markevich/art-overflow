FactoryGirl.define do
  factory :comment do
    user
    content "Very important comment!"
    raw_content "Very important comment!"
  end
end
