require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.default_selector = :css

  include FactoryGirl::Syntax::Methods
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
