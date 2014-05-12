require 'spec_helper'

describe UserAvatarsController do
  let(:user) { create(:user) }

  before { sign_in(user) }

  context 'unauthorized' do
    describe "#edit" do
      it_should_behave_like 'unauthorized action' do
        before { get :edit, id: create(:user).id }
      end
    end

    describe "#update" do
      it_should_behave_like 'unauthorized action' do
        before { get :update, id: create(:user).id }
      end
    end
  end

  it_should_behave_like 'edit action' do
    before { get :edit, id: user.id }
  end

  it_should_behave_like 'update action' do
    let(:avatar) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/avatar.jpg'))) }

    let(:valid_params) do
      { id: user.id, user: {avatar: avatar} }
    end
  end
end
