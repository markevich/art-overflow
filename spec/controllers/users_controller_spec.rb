require 'spec_helper'

describe UsersController do
  it { should respond_to(:follow) }
  it { should respond_to(:stop_following) }

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  before { sign_in user }
  
  def follow_user
    post :follow, id: another_user.id
  end  

  describe "#follow" do
    it { expect{ follow_user }.to change(user, :follow_count).by(1) }
    it { expect{ follow_user }.to change(another_user, :followers_count).by(1) }
    it { expect(follow_user).to redirect_to(action: :show) }
  end

  describe "#stop_following" do
    before { follow_user }
    def stop_following_user
      post :stop_following, id: another_user.id
    end

    it { expect{ stop_following_user }.to change(user, :follow_count).by(-1) }
    it { expect{ stop_following_user }.to change(another_user, :followers_count).by(-1) }
    it { expect(post :follow, id: user.id).to redirect_to(action: :show) }
    it { expect(stop_following_user).to redirect_to(action: :show) }
    it { expect(post :stop_following, id: user.id).to redirect_to(action: :show) }
  end
end