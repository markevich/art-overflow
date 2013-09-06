require 'spec_helper'

describe User do
  it { should have_many(:pictures) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

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

  describe '#liked?' do
    let(:likeable) { create(:comment) }

    context 'liked' do
      before { user.likes.create(likeable: likeable) }

      it { expect(user.liked?(likeable)).to be_true }
    end

    context 'not liked' do
      it { expect(user.liked?(likeable)).to be_false }
    end
  end

  describe '#like' do
    let(:likeable) { create(:comment) }

    it { expect { user.like(likeable) }.to change(Like, :count).by(1)}
  end

  describe '#unlike' do
    let(:likeable) { create(:comment) }
    before { user.likes.create(likeable: likeable) }

    it { expect { user.unlike(likeable) }.to change(Like, :count).by(-1)}
  end
end
