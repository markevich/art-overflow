require 'spec_helper'

describe User do
  it { should have_many(:pictures) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:email) }

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
