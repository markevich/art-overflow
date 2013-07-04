require 'spec_helper'
describe SubscribersController do
  context '.unsubscribe' do
    let(:token) { 'secure_token' }
    let(:id) { 1 }
    before do
      SecureRandom.stub(:urlsafe_base64).and_return 'secure_token'
      create(:subscriber, id: id)
    end
    it { expect{ get :unsubscribe, id: 666 }.to raise_error ActiveRecord::RecordNotFound }

    it { expect{ get :unsubscribe, id: id}.to raise_error ActiveRecord::RecordNotFound }
    it { expect{ get :unsubscribe, id: id, token: 'incorrect_token' }.to raise_error ActiveRecord::RecordNotFound }
    it { expect{ get :unsubscribe, id: id, token: token }.to_not raise_error ActiveRecord::RecordNotFound }

    it 'destroy subscriber' do
      get :unsubscribe, id: id, token: token
      expect{Subscriber.find(id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
