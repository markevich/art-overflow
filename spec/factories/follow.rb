FactoryGirl.define do
  factory :follow do
    association :follower, factory: :user
    association :followable, factory: :user
  end
end