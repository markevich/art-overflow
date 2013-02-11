require "rspec"

describe UsersController do
  let(:user) { create(:user) }
  let(:valid_params) { {id: user.id} }
  before do

  end
  describe 'GET show' do
    it 'show 200 if user exist' do
      get :show, valid_params
      response.should be_success
    end
    it 'show 404 if user not exist' do
      expect { get :show, {id: 'bad'} }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end