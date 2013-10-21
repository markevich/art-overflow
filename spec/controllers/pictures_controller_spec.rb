require 'spec_helper'

describe PicturesController do
  it { should respond_to(:like) }
  it { should respond_to(:unlike) }

  let(:user) { create(:user) }
  before { sign_in user }

  describe "#like" do
    let(:pic) { create(:picture) }
    it 'changes likes count' do
      post :like, id: pic.id
      expect(pic.reload.likes_count).to eq 1
      response.body.should eq({count: pic.likes_count, state: :active}.to_json)
    end
  end

  describe "#unlike" do
    let(:pic) { create(:picture) }
    it 'returns likes count' do
      user.like(pic)
      post :unlike, id: pic.id
      expect(pic.reload.likes_count).to eq 0
      response.body.should eq({count: pic.likes_count, state: :inactive}.to_json)
    end
  end

  describe "#create" do
    let(:params) {
      {
        :picture => {
          :name => "test pic", 
          :path => Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/avatar.jpg')),
          :tag_list => "tag1 tag2 tag3"
        }
      }
    }

    it { expect { post :create, params }.to change(Picture, :count).by(1) }
    it { expect { post :create, params }.to change(ActsAsTaggableOn::Tagging, :count).by(3) }
  end

  describe "#show" do
    let(:pic) { create(:picture) }
    before { get :show, id: pic.id }

    it { assigns(:picture).should_not be_nil }
    it { response.should be_success }
  end
end
