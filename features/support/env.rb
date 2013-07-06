require 'rubygems'
require 'spork'

Spork.prefork do
  require 'sidekiq'
  require 'sidekiq/testing/inline'
  require 'cucumber/rails'
  require 'capybara/poltergeist'
  if false
    Capybara.javascript_driver = :selenium
    require 'capybara/firebug'
  else
    Capybara.javascript_driver = :poltergeist
  end

  Capybara.default_selector = :css

  World(FactoryGirl::Syntax::Methods)
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
    DatabaseCleaner.strategy = :truncation
  end
  Cucumber::Rails::Database.javascript_strategy = :truncation
end
