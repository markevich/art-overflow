require 'spec_helper'

describe 'validate FactoryGirl factories' do
  FactoryGirl.factories.each do |factory|
    context "with factory for :#{factory.name}" do
      let(:instance) { build(factory.name) }

      it "is valid" do
        expect(instance).to be_valid, instance.errors.full_messages.join(', ')
      end
    end
  end
end
