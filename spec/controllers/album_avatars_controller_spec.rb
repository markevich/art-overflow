require 'spec_helper'

describe AlbumAvatarsController do
  let(:user) { create(:user) }
  let(:album) { create(:album, user: user) }

  before { sign_in(user) }

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
  end

  it_should_behave_like 'edit action' do
    before { get :edit, id: album.id }
  end

  it_should_behave_like 'update action' do
    let(:avatar) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/avatar.jpg'))) }

    let(:valid_params) do
      { id: album.id, album: {avatar: avatar} }
    end
  end
end
