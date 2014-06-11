RSpec.configure do |config|
  config.before(:all, callbacks: true) do
    ActiveRecord::Base.skip_callbacks = false
  end

  config.after(:all, callbacks: true) do
    ActiveRecord::Base.skip_callbacks = true
  end
end


ActiveRecord::Base.skip_callbacks = true
