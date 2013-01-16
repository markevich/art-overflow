require 'rubygems'
require 'spork'
require "email_spec"

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
 
  require 'factory_girl'
 
  Rails.backtrace_cleaner.remove_silencers!
 
  require 'database_cleaner'

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end
 
    config.before(:each) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.include Devise::TestHelpers
  end
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end
