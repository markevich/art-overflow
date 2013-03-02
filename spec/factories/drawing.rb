include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :drawing do
    path { fixture_file_upload('features/resources/drawing.jpg', 'image/jpg') }
    user { FactoryGirl.create :user, :another }
  end
end
