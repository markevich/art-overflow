require 'exception_notification/rails'

require 'exception_notification/sidekiq'

ExceptionNotification.configure do |config|
  config.ignore_if do |exception, options|
    not Rails.env.production?
  end

  config.add_notifier :email, {
    :email_prefix => "[Artoverflow в печали!] ",
    :sender_address => %{"notifier" <info@artoverflow.com>},
    :exception_recipients => %w{slava.markevich@gmail.com onemur@gmail.com}
  }
end
