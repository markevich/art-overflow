source 'http://rubygems.org'

gem 'rails', '4.0.0.rc1'

gem 'mysql2'
gem 'devise', '3.0.0.rc'
gem 'devise_invitable', git: 'git://github.com/scambra/devise_invitable.git', branch: 'rails4'
gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git', branch: 'rails-4'
gem 'simple_form'
gem 'haml-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'public_activity', git: 'https://github.com/pokonski/public_activity.git', branch: 'rails4'

#sidekiq
gem 'sidekiq'
gem 'slim', '1.3.8'
gem 'sinatra', :require => nil
#

# translating gems
gem 'russian'
gem 'devise-i18n'

gem 'cancan'

gem 'jquery-rails'
gem 'turbolinks'
gem "acts_as_follower"
gem 'thumbs_up'

# comments gems
gem 'awesome_nested_set'
gem 'the_comments', path: '/Users/markevich/Projects/the_comments/'

group :assets do
  gem 'sass-rails', '4.0.0.rc1'
  gem 'coffee-rails'
  gem 'bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'
  gem 'font-awesome-sass-rails'
end


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
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
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
