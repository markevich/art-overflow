require_relative '../spec_helper'
describe "application/index.html.haml" do
  context 'when user authorized' do
    xit 'show user name' do
      
    end
  end
  context 'when user is not authorized' do
    it 'show sign in link' do
      render :template => "application/index", :layout => "layouts/application"
      rendered.should include login_users_path
    end
  end
end

