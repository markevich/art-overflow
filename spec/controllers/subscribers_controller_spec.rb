require 'spec_helper'
describe SubscribersController do
  context '.unsubscribe' do
    let(:token) { 'secure_token' }
    let(:id) { 1 }
    before do
      allow(SecureRandom).to receive(:urlsafe_base64).and_return 'secure_token'
      create(:subscriber, id: id)
    end

    it 'show 404 unless user exists' do
      expect{ get :unsubscribe, id: 666 }.to raise_error ActiveRecord::RecordNotFound
    end

    it 'show 404 if token is nil' do
      expect{ get :unsubscribe, id: id}.to raise_error ActiveRecord::RecordNotFound
    end

    it 'show 404 if token is incorrect' do
      expect{ get :unsubscribe, id: id, token: 'incorrect_token' }.to raise_error ActiveRecord::RecordNotFound
    end

    it 'doesn\'t fail if params are correct' do
      expect{ get :unsubscribe, id: id, token: token }.to_not raise_error
    end

    it 'destroy subscriber' do
      get :unsubscribe, id: id, token: token
      expect{Subscriber.find(id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
