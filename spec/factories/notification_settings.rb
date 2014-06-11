# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification_settings, :class => 'NotificationSettings' do
    news true
    comments true
    subscribers true
  end
end
