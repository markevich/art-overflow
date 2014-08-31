require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  before { sign_in user }

  context 'unauthorized' do
    describe "#edit" do
      it_should_behave_like 'unauthorized action' do
        before { get :edit, id: create(:user).id }
      end
    end

    describe "#update" do
      it_should_behave_like 'unauthorized action' do
        before { get :update, id: create(:user).id }
      end
    end
  end

  it_should_behave_like 'update action' do
    let(:valid_params) do
      { id: user.id, user: {slug: "test"} }
    end

    let(:invalid_params) do
      { id: user.id, user: {slug: ""} }
    end
  end
end
