require 'rubygems'

require 'sidekiq'
require 'sidekiq/testing/inline'
require 'cucumber/rails'
require 'capybara/poltergeist'
require 'cucumber/rspec/doubles'
if false
  Capybara.javascript_driver = :selenium
  require 'capybara/firebug'
else
  Capybara.javascript_driver = :poltergeist
end

Capybara.default_selector = :css

full_names = Dir["#{Rails.root}/app/helpers/*.rb"]
full_names.collect do |full_name|
  include Object.const_get(File.basename(full_name,'.rb').camelize)
end

World(FactoryGirl::Syntax::Methods)

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

DatabaseCleaner.strategy = :transaction

Before do
  #get rid of noisy messages vatar.jpg 568x640 24bit N JFIF  [OK] 114403 --> 114341 bytes (0.05%), optimized.
  ImageOptimizer.stub(:new).and_return double('ImageOptimizer').as_null_object
end

Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
  DatabaseCleaner.strategy = :truncation
end

Cucumber::Rails::Database.javascript_strategy = :truncation
