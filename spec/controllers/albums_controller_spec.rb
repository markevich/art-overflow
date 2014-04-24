require 'spec_helper'

describe AlbumsController do
  let(:user) { create(:user) }
  let(:album) { create(:album, user: user) }

  it_should_behave_like 'index action' do
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
end
