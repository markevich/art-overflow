require 'spec_helper'

describe UserLikesController do
  let(:user) { create(:user) }
  before { sign_in user }

  it_should_behave_like 'index action' do
    let!(:pic) { create(:picture) }

    before { user.likes.create!(likeable: pic) }

    before { get :index, user_id: user.id }
  end
end
