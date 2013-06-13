require 'spec_helper'

describe PicturesController do
  it { should respond_to(:like) }
  it { should respond_to(:unlike) }
  let(:user) { create(:user) }
  before { sign_in user }

  # describe "#like" do
  #   let(:pic) { create(:picture) }
  #   it { expect { post :like, id: pic.id }.to change(pic, :votes_for).by(1) }
  #   it { expect { post :like, id: pic.id }.to change(pic.activities, :count).by(1) }
  #   it { expect(post :like, id: pic.id).to redirect_to(action: :show) }
  # end  

  # describe "#unlike" do
  #   let(:pic) { create(:picture) }
  #   before { post :like, id: pic.id }
  #   it { expect { post :unlike, id: pic.id }.to change(pic, :votes_for).by(-1) }
  #   it { expect { post :unlike, id: pic.id }.to change(pic.activities, :count).by(-1) }
  #   it { expect(post :unlike, id: pic.id).to redirect_to(action: :show) }
  # end

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

    before { post :create, params }
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