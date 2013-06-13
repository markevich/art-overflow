# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery do
    user
    name "Gallery"
    description "Gallery description."
  end
end
