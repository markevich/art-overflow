require 'rails_helper'

describe NewCommentMailer do
  let(:comment) { create(:comment) }

  describe '#deliver' do
    it 'sends email with attachment' do
      expect(ActionMailer::Base.deliveries.count).to eq 0
      described_class.send_notification(comment.id)
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end
  end
end
