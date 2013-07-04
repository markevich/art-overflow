require 'spec_helper'
describe Subscriber do
  let(:params) { {email: 'example@example.com'} }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  context '.before_create' do
    it 'should generate token' do
      instance = Subscriber.create(params)
      expect(instance.token).to_not be_nil
    end
  end
end
