require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ArtOverflow
  class Application < Rails::Application
    config.autoload_paths += %W{#{config.root}/app #{config.root}/lib}

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.active_record.observers = begin
      observers_path = Rails.root.join('app/observers/').to_s
      Dir["#{observers_path}**/*.rb"].map do |f|
        f.gsub(observers_path.to_s, '').gsub(/\.rb\z/, '')
      end
    end

    config.i18n.default_locale = :ru
    config.i18n.locale = :ru

    I18n.enforce_available_locales = true

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w(load-image.min.js jquery.Jcrop.js jquery.Jcrop.css)
    config.assets.precompile += %w(jquery.adaptive-backgrounds.min.js)
  end
end
