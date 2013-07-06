require 'spec_helper'
describe SubscriberObserver do
  it 'Send welcome email after creation' do
    Workers::Mail::WelcomeEmail.should_receive(:perform_async)

    Subscriber.observers.enable SubscriberObserver do
      create(:subscriber)
    end
  end
end
