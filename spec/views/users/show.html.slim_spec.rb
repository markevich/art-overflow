require "rspec"

describe 'users/show.html.slim' do

  context "presence of elements" do
    subject { rendered }
    let(:user) { create(:user) }
    before do
      assign(:user, user)
    end
    context 'another user' do
      before { render }
      it 'show user name' do
        subject.should have_content user.name
      end
      it 'should have follow button' do
        subject.should have_button "Follow"
      end
    end


    context 'own profile' do
      before { view.stub(:current_user).and_return user }
      it 'should not have follow button' do
        render
        subject.should_not have_content "Follow"
      end
    end

  end

end