require 'spec_helper'

describe PicturesController do
  let(:user) { create(:user) }
  before { sign_in user }

  it_should_behave_like 'index action' do
    let!(:pic) { create(:picture) }

    before { get :index }
  end

  it_should_behave_like 'new action' do
    before { get :new }
  end

  it_should_behave_like 'show action', :picture

  it_should_behave_like 'create action' do
    let(:path) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/avatar.jpg'))) }
    let(:valid_params) { { picture: build_attributes_for(:picture).merge(path: path) } }

    let(:invalid_params) { { picture: build_attributes_for(:picture) } }
  end


  describe "#unlike" do
    let(:pic) { create(:picture) }
    it 'returns likes count' do
      user.like(pic)
      post :unlike, id: pic.id

      expect(pic.reload.likes_count).to eq 0
      expect(response.body).to eq({count: pic.likes_count, state: :inactive}.to_json)
    end
  end

  describe "#like" do
    let(:pic) { create(:picture) }
    it 'changes likes count' do
      post :like, id: pic.id

      expect(pic.reload.likes_count).to eq 1
      expect(response.body).to eq({count: pic.likes_count, state: :active}.to_json)
    end
  end
end
