require 'rails_helper'

describe UserFollowersController do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  before { sign_in user }

  it_should_behave_like 'index action' do
    before { another_user.follow(user) }

    before { get :index, user_id: user.id }

    it { expect(assigns[:collection]).to_not be_empty }
  end
end
