source 'http://rubygems.org'

gem 'rails', '4.0.0'
gem 'rails-observers'

gem 'mysql2'
gem 'devise', '3.0.0.rc'
gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git', branch: 'rails-4'
gem 'simple_form'
gem 'haml-rails'

gem 'carrierwave'
gem 'carrierwave-imageoptimizer'

gem 'mini_magick'
gem 'public_activity', git: 'https://github.com/pokonski/public_activity.git'

#sidekiq
gem 'sidekiq'
gem 'slim', '1.3.8'
gem 'sinatra', :require => nil
#

# monitoring
gem 'newrelic_rpm'
#

#caching
gem 'dalli'
#

#Email delivery method
gem 'madmimi-rails', '0.0.1.1'
#

# push state with degradation to xhtml 4
gem 'historyjs-rails'
#

#notify about exceptions by email
gem 'exception_notification', '4.0.0'
#

# translating gems
gem 'russian'
gem 'devise-i18n'

gem 'cancan'

gem 'jquery-rails'
gem 'turbolinks'
gem "acts_as_follower"
gem 'thumbs_up'
gem 'acts-as-taggable-on'

# comments gems
gem 'awesome_nested_set'
gem 'the_comments', git: 'git://github.com/markevich/the_comments.git'

gem 'sass-rails', '4.0.0'
gem 'coffee-rails'
gem 'uglifier', '>= 1.0.3'


group :development do
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'meta_request'
  gem 'bullet'
  gem 'uniform_notifier'
  gem 'ruby_gntp'
end

group :development, :test do
  gem 'debugger'
end

group :production do
  gem 'unicorn'
  gem 'google-analytics-rails'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'capybara-firebug'
  gem 'fuubar'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'spork-rails', github: 'railstutorial/spork-rails'
end
#gem 'jbuilder', '~> 1.0.1'
