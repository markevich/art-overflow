FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@test.com"
    password "1234567"
    password_confirmation "1234567"
    confirmed_at Time.now
    role :user
  end
end