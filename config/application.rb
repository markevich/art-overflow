require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module ArtOverflow
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.assets.initialize_on_precompile = false
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
