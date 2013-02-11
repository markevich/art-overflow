require "rspec"

describe 'users/show.html.slim' do

  context "presence of elements" do
    subject { rendered }
    let(:current_user) { create(:user) }
    let(:another_user) { create(:user, :another) }
    before do
      assign(:user, another_user)
      view.stub(:current_user).and_return current_user
    end

    it 'show user name' do
      render
      subject.should have_content another_user.name
    end

    context 'another user' do
      it 'should have follow button' do
        render
        subject.should have_button "Follow"
      end

      context 'already followed' do
        before do
          current_user.stub(:following?).with(another_user).and_return true
        end
        it 'should have unfollow button' do
          render
          subject.should have_button "Unfollow"
        end
      end
    end


    context 'own profile' do
      before { assign(:user, current_user) }
      it 'should not have follow button' do
        render
        subject.should_not have_button "Follow"
      end
    end

  end

end

