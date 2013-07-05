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
    config.autoload_paths += %W{#{config.root}/app}
    config.i18n.default_locale = :ru
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w(*jbar.js *jbar.css subscribe.css)
    config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js']
  end
end
