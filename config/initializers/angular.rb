Rails.application.assets.context_class.class_eval do
  include AngularHelper
  # include Rails.application.routes.url_helpers
end
