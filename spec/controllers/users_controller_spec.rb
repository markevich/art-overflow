require "rspec"

describe UsersController do
  let(:another_user) { create(:user, :another) }
  describe 'GET show' do
    let(:valid_params) { {id: another_user.id} }
    it 'show 200 if user exist' do
      get :show, valid_params
      response.should be_success
    end
    it 'show 404 if user not exist' do
      expect { get :show, {id: 'bad'} }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'POST follow' do
    let(:current_user) { create(:user) }
    let(:valid_params) { {id: another_user.id} }
    before do
      UsersController.stub(:current_user).and_return current_user
    end

    it 'show 401 if user not authorized' do
      UsersController.stub(:current_user).and_return nil
      post :follow, valid_params
      response.status.should == 401
    end

    it 'makes current_user to follow another user' do

    end
  end
end