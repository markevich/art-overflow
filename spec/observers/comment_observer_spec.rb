require 'rails_helper'

describe CommentObserver do
  include_context 'with enabled observers', CommentObserver

  describe '#after_commit' do
    let(:comment) { build(:comment) }

    before do
      allow(NotificationWorker).to receive(:perform_async)
      comment.save!
      comment.run_callbacks(:commit)
    end

    it { expect(NotificationWorker).to have_received(:perform_async) }
  end
end
