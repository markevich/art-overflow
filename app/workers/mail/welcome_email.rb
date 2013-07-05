module Workers
  module Mail
    class WelcomeEmail
      include Sidekiq::Worker
      sidekiq_options queue: :mail

      def perform(subscriber_id)
        subscriber = Subscriber.find(subscriber_id)
        SubscriberMailer.welcome_email(subscriber).deliver!
      end
    end
  end
end
