require 'rubygems'
require 'spork'
 
Spork.prefork do
  require 'cucumber/rails'
  require 'cucumber/formatter/unicode' 
  require 'capybara/poltergeist'
  Capybara.default_selector = :css
  Capybara.javascript_driver = :poltergeist
end
 
Spork.each_run do

  ActionController::Base.allow_rescue = false
  
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation

end
