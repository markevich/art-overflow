require 'spec_helper'

describe User do
  it { should have_many(:pictures) }

  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin) }
  describe "#become_admin!" do
    it { expect { user.become_admin! }.to change(user, :role).to(:admin) }
  end

  describe "#admin?" do
    it { expect(user).to_not be_admin}
    it { expect(admin_user).to be_admin}
  end
end
