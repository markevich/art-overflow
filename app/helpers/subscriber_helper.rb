module SubscriberHelper
  def unsubscribe_link(subscriber, options = {})
    link_to I18n.t('subscriber.unsubscribe'), unsubscribe_url(subscriber), options
  end

  def unsubscribe_url(subscriber)
    unsubscribe_subscriber_url(subscriber, token: subscriber.token)
  end
end
