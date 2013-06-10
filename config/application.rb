require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

def compile_asset?(path)
  # ignores any filename that begins with '_' (e.g. sass partials)
  # all other css/js/sass/image files are processed
  if File.basename(path) =~ /^[^_].*\.\w+$/
    puts "Compiling: #{path}"
    true
  else
    puts "Ignoring: #{path}"
    false
  end
end

module ArtOverflow
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.assets.precompile = [ method(:compile_asset?).to_proc ]
  end
end
