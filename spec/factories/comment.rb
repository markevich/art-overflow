FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :picture
    text "Very important comment!"
  end
end
