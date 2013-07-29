class SubscriberObserver < ActiveRecord::Observer
  def after_create(subscriber)
    #Workers::Mail::WelcomeEmail.perform_async(subscriber.id)
  end
end
