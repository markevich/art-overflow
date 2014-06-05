RSpec.configure do |config|
  config.before(:all, public_activity: true) do
    PublicActivity.enabled = true
  end

  config.after(:all, public_activity: true) do
    PublicActivity.enabled = false
  end
end


PublicActivity.enabled = false
