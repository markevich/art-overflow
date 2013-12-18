shared_examples 'destroy action' do

  context 'response' do
    before { delete :destroy, params }

    it { should respond_with(:redirect) }
    it { should set_the_flash }
  end

end
