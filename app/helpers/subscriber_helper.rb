module SubscriberHelper
  def unsubscribe_link(subscriber)
    link_to I18n.t('subscriber.unsubscribe'), unsubscribe_path(subscriber)
  end

  def unsubscribe_path(subscriber)
    unsubscribe_subscriber_path(subscriber, token: subscriber.token)
  end
end
