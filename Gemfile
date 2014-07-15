source 'http://rubygems.org'

#rails
gem 'rails', '4.1.0'
gem 'rails-observers'
gem 'turbolinks'
gem 'jquery-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
#
#
gem 'nprogress-rails'
gem 'petrovich'
gem 'auto_html'
gem 'angularjs-rails'
gem 'ng-rails-csrf'

gem 'exception_notification'

gem 'jquery-ui-rails'
gem 'jquery-modal-rails', github: 'dei79/jquery-modal-rails'

#template rendering
gem 'simple_form'
gem 'haml-rails'
#

gem 'jcrop-rails-v2'
gem 'tire'
gem 'google-analytics-turbolinks'

#authentication processing
gem 'devise'
#

#database adapter
gem 'pg'
#

#
gem "compass-rails"
gem 'zurb-foundation'
#

#image uploading and preprocessing
gem 'carrierwave'
gem 'carrierwave-imageoptimizer'
gem 'mini_magick'
#


#sidekiq
gem 'sidekiq'
gem 'slim'
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

gem 'cancan'

gem 'inherited_resources'
gem 'responders'
gem 'public_activity'

gem 'rabl-rails'

gem 'friendly_id'

group :development do
  gem 'capistrano', '2.15.5'
  gem 'capistrano-rbenv'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'meta_request'
  gem 'bullet'
  gem 'uniform_notifier'
  gem 'ruby_gntp'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :production do
  #Email delivery method
  # gem 'madmimi-rails', '0.0.1.1'
  #
end

group :development, :test do
  gem 'pry-rails'
end

group :production do
  #notify about exceptions by email
  #

  #caching
  gem 'dalli'
  #

  # monitoring
  gem 'newrelic_rpm'
  #

  #web server
  gem 'unicorn'
  gem 'unicorn-worker-killer'
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
  gem 'fakeweb'

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
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'capybara', github: 'jnicklas/capybara'
  gem 'factory_girl_rails'
end
gem 'sprockets-rails', github: 'rails/sprockets-rails'
