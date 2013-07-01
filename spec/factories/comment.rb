FactoryGirl.define do
  factory :comment do
    user
    content "123"
    raw_content "123"
  end
end
