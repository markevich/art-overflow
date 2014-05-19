FactoryGirl.define do
  factory :activity, class: PublicActivity::Activity do
    association :owner, factory: :user
    association :trackable, factory: :like
    association :recipient, factory: :user
    key 'like.create'
  end
end
