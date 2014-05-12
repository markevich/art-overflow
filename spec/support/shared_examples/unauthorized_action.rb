shared_examples 'unauthorized action' do
  render_views

  context 'unauthorized user' do
    before do
      sign_out :user
    end

    it do
      should respond_with(:redirect)
      should set_the_flash
      expect(flash.alert).to eq I18n.t('unauthorized.default')
    end
  end

  context 'logged in other user' do
    let(:other_user) { create(:user) }

    before do
      sign_out :user
      sign_in other_user
    end

    it do
      should respond_with(:redirect)
      should set_the_flash
      expect(flash.alert).to eq I18n.t('unauthorized.default')
    end
  end
end
