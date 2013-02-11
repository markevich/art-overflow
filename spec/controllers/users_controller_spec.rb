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

  context 'following' do
    let(:current_user) { create(:user) }
    let(:valid_params) { {id: another_user.id} }
    before do
      controller.stub(:current_user).and_return current_user
      controller.stub(:user_signed_in?).and_return true
    end

    it 'show 401 if user not authorized' do
      controller.stub(:user_signed_in?).and_return false
      post :follow, valid_params
      response.status.should == 401
    end

    describe 'POST follow' do
      it 'makes current_user to follow another user' do
        current_user.should_receive(:follow).with(another_user)
        post :follow, valid_params
        response.should be_success
      end
    end

    describe 'POST unfollow' do
      it 'makes current_user to stop following another user' do
        current_user.should_receive(:stop_following).with(another_user)
        post :unfollow, valid_params
        response.should be_success
      end
    end
  end
end