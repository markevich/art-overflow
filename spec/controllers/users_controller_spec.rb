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
      it { expect(follow_user).to be_success }

      it { expect { follow_self }.not_to change{ user.follow_count } }
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

    context 'authorized' do
      before { follow_user }

      it { expect{ stop_following_user }.to change(user, :follow_count).by(-1) }
      it { expect{ stop_following_user }.to change(another_user, :followers_count).by(-1) }
      it { expect(stop_following_user).to be_success }
    end

    context 'unauthorized' do
      before { sign_out :user}
      it 'redirect to sign_in page', devise: true do
        expect { stop_following_user }.to change(response, :redirect_url).to(new_user_session_url)
      end
    end
  end

  context 'avatar' do
    describe '#avatar_edit' do
      before do
        sign_in user
        get :avatar_edit, id: user.id
      end

      render_views

      it do
        should respond_with(:success)
        should render_template(:avatar_edit)
        should_not set_the_flash
      end
    end

    describe '#avatar_update' do
      let(:path) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/avatar.jpg'))) }
      before do
        sign_in user
        patch :avatar_update, id: user.id, user: { avatar: path }
      end

      render_views

      it { should respond_with(:redirect) }
      it { should set_the_flash }
      it 'does not set errors for resource' do
        resource = assigns(user)
        if resource && resource.errors.present?
          raise resource.errors.full_messages.inspect
        end
      end
    end
  end
end
