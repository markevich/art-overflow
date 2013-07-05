require 'spec_helper'
describe Workers::Mail::WelcomeEmail do
  let(:subscriber) { create(:subscriber) }
  let(:worker) { Workers::Mail::WelcomeEmail }
  it { expect { worker.perform_async(subscriber.id) }.to change(worker.jobs, :size).by(1) }
  it 'raise error if subscriber doesn\'t exists' do
    expect { worker.new.perform(666) }.to raise_error ActiveRecord::RecordNotFound
  end
  it 'deliver message' do
    SubscriberMailer = mock('mailer').as_null_object
    SubscriberMailer.should_receive(:welcome_email).with(subscriber)
    SubscriberMailer.should_receive(:deliver!)
    worker.new.perform(subscriber.id)
  end
end
