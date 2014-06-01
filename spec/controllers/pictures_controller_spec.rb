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

  context 'unauthorized' do
    describe "#edit" do
      it_should_behave_like 'unauthorized action' do
        before { get :edit, id: create(:picture).id }
      end
    end

    describe "#update" do
      it_should_behave_like 'unauthorized action' do
        before { get :update, id: create(:picture).id }
      end
    end

    describe "#destroy" do
      it_should_behave_like 'unauthorized action' do
        before { get :destroy, id: create(:picture).id }
      end
    end
  end
end
