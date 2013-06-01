require 'spec_helper'

describe PicturesController do
  it { should respond_to(:like) }
  it { should respond_to(:unlike) }
  let(:user) { create(:user) }
  before { sign_in user }

  describe "#like" do
    let(:pic) { create(:picture) }
    it { expect { post :like, id: pic.id }.to change(pic, :votes_for).by(1) }
  end  

  describe "#unlike" do
    let(:pic) { create(:picture) }
    before { post :like, id: pic.id }
    it { expect { post :unlike, id: pic.id }.to change(pic, :votes_for).by(-1) }
  end
end