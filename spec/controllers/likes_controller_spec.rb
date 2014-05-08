require 'spec_helper'

describe LikesController do
  let(:user) { create(:user) }
  before { sign_in user }

  it_should_behave_like 'index action' do
    let!(:pic) { create(:picture) }

    before { get :index, user_id: user.id }
  end
end