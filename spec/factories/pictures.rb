FactoryGirl.define do
  factory :picture do
    name "Test Pic"
    path Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/avatar.jpg')))
    user

    trait :with_likes do
      after(:create) do |picture|
        picture.likes.create!(user: picture.user)
      end
    end
  end
end
