FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :name do |n|
    "user_#{n}"
  end

  factory :user do
    nickname "Batman"
    name "Bruce Wayne"
    email
    city 'Minsk'
    password "1234567"
    password_confirmation "1234567"
    confirmed_at Time.now
    role :user
    trait :admin do
      role :admin
    end
  end
end
