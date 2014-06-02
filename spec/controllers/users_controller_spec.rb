require 'spec_helper'

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
end
