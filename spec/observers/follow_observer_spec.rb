require 'rails_helper'

describe FollowObserver do
  include_context 'with enabled observers', FollowObserver

  describe '#after_commit' do
    let(:follow) { build(:follow) }

    before do
      allow(NotificationWorker).to receive(:perform_async)
      follow.save!
      follow.run_callbacks(:commit)
    end

    it { expect(NotificationWorker).to have_received(:perform_async) }
  end
end
