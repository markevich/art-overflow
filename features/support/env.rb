require 'rubygems'
require 'spork'
 
Spork.prefork do
  require 'cucumber/rails'
  require 'cucumber/formatter/unicode'
  require 'cucumber/rspec/doubles'
  require 'capybara/poltergeist'
  Capybara.default_selector = :css
  Capybara.javascript_driver = :poltergeist
  
  full_names = Dir["#{Rails.root}/app/helpers/*.rb"]
  full_names.collect do |full_name|
    include Object.const_get(File.basename(full_name,'.rb').camelize)
  end
end
 
Spork.each_run do
  World FactoryGirl::Syntax::Methods
  ActionController::Base.allow_rescue = false
  
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation

end
