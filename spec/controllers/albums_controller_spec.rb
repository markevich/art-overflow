require 'spec_helper'

describe AlbumsController do
  let(:user) { create(:user) }

  before { sign_in(user) }

  let(:album) { create(:album, user: user) }

  it_should_behave_like 'index action' do
    before { create(:album, user: user) }

    before { get :index, user_id: user.id }
  end

  it_should_behave_like 'new action' do
    before { get :new, user_id: user.id }
  end

  it_should_behave_like 'edit action' do
    before { get :edit, user_id: user.id, id: album.id }
  end

  it_should_behave_like 'update action' do
    let(:valid_params) do
      { user_id: user.id, id: album.id, album: {name: 'valid'} }
    end

    let(:invalid_params) do
      { user_id: user.id, id: album.id, album: {name: nil} }
    end
  end

  it_should_behave_like 'destroy action' do
    let(:params){{ user_id: user.id, id: album.id }}
  end

  context 'unauthorized' do
    describe "#edit" do
      it_should_behave_like 'unauthorized action' do
        before { get :edit, id: create(:album).id }
      end
    end

    describe "#update" do
      it_should_behave_like 'unauthorized action' do
        before { get :update, id: create(:album).id }
      end
    end

    describe "#destroy" do
      it_should_behave_like 'unauthorized action' do
        before { get :destroy, id: create(:album).id }
      end
    end
  end
end
