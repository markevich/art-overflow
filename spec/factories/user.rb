FactoryGirl.define do
  factory :user do
    name                  "Testy enod"
    email                 "example@example.com"
    password              "please"
    password_confirmation "please"
    confirmed_at          Time.now
  end
end