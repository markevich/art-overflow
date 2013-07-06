require 'spec_helper'
#perfect example for injection of rspec shared examples
#TODO: add shared examples, ie should_behave_like :followable
describe UsersController do
  it { should respond_to(:follow) }
  it { should respond_to(:stop_following) }

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  before { sign_in user }

  def follow_user
    post :follow, id: another_user.id
  end

  def follow_self
    post :follow, id: user.id
  end

  describe "#follow" do
    context 'authorized' do
      it { expect{ follow_user }.to change(user, :follow_count).by(1) }
      it { expect{ follow_user }.to change(another_user, :followers_count).by(1) }
      it { expect(follow_user).to redirect_to(action: :show) }
      it { expect{ follow_user }.to change(another_user.activities, :count).by(1) }
      it { expect{ follow_user }.to change { flash[:notice] } }

      it { expect { follow_self }.to_not change(user, :follow_count).by(1) }
      it { expect(follow_self).to redirect_to(action: :show) }
    end

    context 'unauthorized' do
      before { sign_out :user}
      it 'redirect to sign_in page', devise: true do
        expect { follow_user }.to change(response, :redirect_url).to(new_user_session_url)
      end
    end
  end

  describe "#stop_following" do
    def stop_following_user
      post :stop_following, id: another_user.id
    end

    def stop_following_self
      post :stop_following, id: user.id
    end

    context 'authorized' do
      before { follow_user }

      it { expect{ stop_following_user }.to change(user, :follow_count).by(-1) }
      it { expect{ stop_following_user }.to change(another_user, :followers_count).by(-1) }
      it { expect(stop_following_user).to redirect_to(action: :show) }
      it { expect{ stop_following_user }.to change(another_user.activities, :count).by(1) }
      it { expect{ stop_following_user }.to change { flash[:notice] } }

      it { expect { stop_following_self }.to_not change(user, :follow_count).by(-1) }
      it { expect(stop_following_self).to redirect_to(action: :show) }
    end

    context 'unauthorized' do
      before { sign_out :user}
      it 'redirect to sign_in page', devise: true do
        expect { stop_following_user }.to change(response, :redirect_url).to(new_user_session_url)
      end
    end
  end

  describe "#show" do
    context 'authorized' do
      before { sign_in user }

      def open_following_user
        user.follow(another_user)
        get :show, id: another_user.id
      end

      def open_unfollowing_user
        user.stop_following(another_user)
        get :show, id: another_user.id
      end

      it { expect{ open_following_user }.to change{ assigns[:following] }.to(true) }
      it { expect{ open_unfollowing_user }.to change{ assigns(:following) }.to(false) }
    end

    context 'unauthorized' do
      before do
        sign_out :user
        get :show, id: another_user.id
      end

      it { expect(assigns[:following]).to be_false }
    end
  end
end
