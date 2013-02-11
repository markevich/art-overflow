FactoryGirl.define do
  factory :user do
    name                  "Testy user"
    email                 "example@example.com"
    password              "please"
    password_confirmation "please"
    confirmed_at          Time.now

    trait :another do
      id                    200
      name                  "Another user"
      email                 "another@example.com"
    end

  end
end
