require 'rails_helper'

describe NewFollowerMailer do
  let(:follow) { create(:follow) }

  describe '#deliver' do
    it 'sends email with attachment' do
      expect(ActionMailer::Base.deliveries.count).to eq 0
      described_class.send_notification(follow.id)
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end
  end
end
