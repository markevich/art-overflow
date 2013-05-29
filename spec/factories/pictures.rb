FactoryGirl.define do
  factory :picture do
    name "Test Pic"
    path { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/avatar.jpg')) }
    user
  end
end