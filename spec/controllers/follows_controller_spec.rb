require 'rails_helper'

describe FollowsController do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "#destroy" do
    let(:another_user) { create(:user) }

    before { user.follow(another_user) }

    it 'returns followers count' do
      delete :destroy, user_id: another_user.id

      expect(another_user.reload.followers_count).to eq 0
      expect(response.body).to eq({count: another_user.followers_count, state: :inactive}.to_json)
    end
  end

  describe "#create" do
    let(:another_user) { create(:user) }

    it 'changes likes count' do
      post :create, user_id: another_user.id

      expect(another_user.reload.followers_count).to eq 1
      expect(response.body).to eq({count: another_user.followers_count, state: :active}.to_json)
    end
  end
end
