require 'spec_helper'

describe User do
  it { expect(subject).to have_many(:pictures) }

  let(:user) { create(:user) }
  describe "#become_admin" do
    it { expect { user.become_admin! }.to change(user, :role).to(:admin) }
  end

  describe "#admin?" do
    it { expect(user.admin?).to eq(false)}
  end
end