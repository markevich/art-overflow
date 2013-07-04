class WelcomeEmail
  include Sidekiq::Worker
  sidekiq_options queue: :mail

  def perform(subscriber)
    SubscriberMailer.welcome_email(subscriber).deliver!
  end
end
