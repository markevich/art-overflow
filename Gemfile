source 'http://rubygems.org'

#rails
gem 'rails', '4.0.2'
gem 'rails-observers'
gem 'turbolinks'
gem 'jquery-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
#

#template rendering
gem 'simple_form'
gem 'haml-rails'
#

#authentication processing
gem 'devise'
#

#database adapter
gem 'mysql2'
#

#
gem "compass-rails", "~> 2.0.alpha.0"
gem 'zurb-foundation'
#

#image uploading and preprocessing
gem 'carrierwave'
gem 'carrierwave-imageoptimizer'
gem 'mini_magick'
#

#track user activity
gem 'public_activity', git: 'https://github.com/pokonski/public_activity.git'
#

#sidekiq
gem 'sidekiq'
gem 'slim', '1.3.8', group: [:development, :production]
gem 'sinatra', :require => nil, group: [:development, :production]
#

# translating gems
gem 'russian'
gem 'devise-i18n'
#

#following ability
gem "acts_as_follower", github: 'markevich/acts_as_follower', branch: 'rails4'
#

#tags
gem 'acts-as-taggable-on'
#

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

group :development, :production do
  #Email delivery method
  # gem 'madmimi-rails', '0.0.1.1'
  #
end

group :development, :test do
  gem 'debugger'
end

group :production do
  #notify about exceptions by email
  gem 'exception_notification'
  #

  #caching
  gem 'dalli'
  #

  # monitoring
  gem 'newrelic_rpm'
  #

  #web server
  gem 'unicorn'
  #

  #site analytics by google
  gem 'google-analytics-rails'
  #
end

group :test do
  #integration tests
  gem 'cucumber'
  gem 'cucumber-rails', :require => false
  #

  gem 'database_cleaner'

  # fast webkit browser for integration tests
  gem 'poltergeist'
  #

  gem 'selenium-webdriver'

  # firebug profile for firefox/selenium
  gem 'capybara-firebug'
  #

  #    _,------,
  #    _|   /\_/\
  #    ^|__( - .-)
  #      ""  ""
  gem 'nyan-cat-formatter'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end
