module SubscriberWorld
  def create_subscriber
    @current_subscriber ||= create(:subscriber, email: subscriber_email)
  end

  def current_subscriber
    @current_subscriber
  end

  def check_unregistered_subscriber
    expect(@current_subscriber).to be_nil
  end

  def visit_subscribe_page
    visit subscribers_path
  end

  def fill_subscriber_form
    fill_in('subscriber_email', with: subscriber_email)
  end

  def subscriber_email
    @subscriber_email ||= 'example@example.com'
  end
end

World(SubscriberWorld)
World(SubscriberHelper)
