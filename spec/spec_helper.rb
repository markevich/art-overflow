require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "factory_girl"
require 'sidekiq/testing'
require 'shoulda/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

require 'public_activity/testing'
PublicActivity.enabled = false

RSpec.configure do |config|
  config.raise_errors_for_deprecations!

  config.before(:each, devise: true) do
    Rails.application.routes.default_url_options[:host] = 'test.host'
  end

  config.before do
    # ActiveRecord::Base.observers.disable :all
    #get rid of noisy messages vatar.jpg 568x640 24bit N JFIF  [OK] 114403 --> 114341 bytes (0.05%), optimized.
    allow(ImageOptimizer).to receive(:new).and_return(double('ImageOptimizer').as_null_object)
  end

  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = Capybara.current_driver == :rack_test ? :transaction : :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    ActiveRecord::Base.observers.disable :all
  end

  config.after(:all) do
    ActiveRecord::Base.observers.disable :all
  end

  config.with_options type: :feature do |f|
    f.include Capybara::Helpers
  end

  ActiveRecord::Base.skip_callbacks = true

  config.infer_base_class_for_anonymous_controllers = false

  config.with_options :type => :controller do |controller|
    controller.include Devise::TestHelpers
    controller.include FactoryGirl::BuildAttributes
  end
  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers

  config.order = "random"
end

