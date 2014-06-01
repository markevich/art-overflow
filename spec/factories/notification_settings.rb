# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification_setting, :class => 'NotificationSettings' do
    user nil
    news false
    comments false
    subscribers false
  end
end
