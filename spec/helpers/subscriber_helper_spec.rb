require 'spec_helper'
describe SubscriberHelper do
  let(:subscriber) { create(:subscriber) }
  it { expect(helper.unsubscribe_link(subscriber)).to match(/token=.+"/) }
  it { expect(helper.unsubscribe_link(subscriber)).to match(I18n.t('subscriber.unsubscribe')) }
end
