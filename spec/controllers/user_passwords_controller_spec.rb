require "spec_helper"

describe UserPasswordsController do
  let(:user) { create(:user, password: 'old_password', password_confirmation: 'old_password') }

  before { sign_in(user) }

  describe '#edit' do
    before { get :edit, user_id: user.id }

    it_should_behave_like 'edit action'
  end

  it_behaves_like 'update action' do
    let(:valid_params) do
      {
        user_id: user.id,
        user: {
          current_password: 'old_password',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    let(:invalid_params) do
      {
        user_id: user.id,
        user: {
          current_password: 'old_password',
          password: 'password',
          password_confirmation: 'not_the_same_password'
        }
      }
    end
  end
end
