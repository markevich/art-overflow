require 'rubygems'
require 'spork'

Spork.prefork do
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
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  Before do
    #get read of noisy messages vatar.jpg 568x640 24bit N JFIF  [OK] 114403 --> 114341 bytes (0.05%), optimized.
    ImageOptimizer.stub(:new).and_return double('ImageOptimizer').as_null_object
  end
  Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
    DatabaseCleaner.strategy = :truncation
  end
  Cucumber::Rails::Database.javascript_strategy = :truncation
end
