require "rspec"

describe 'users/show.html.slim' do

  context "presence of elements" do
    subject { rendered }
    let(:user) { create(:user) }
    before do
      assign(:user, user)
      render
    end

    it { should have_content user.name }

  end

end