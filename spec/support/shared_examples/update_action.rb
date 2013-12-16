shared_examples 'update action' do
  describe '#update' do
    context 'valid params' do
      let(:params) { valid_params }

      context 'response' do
        before { put :update, params }

        it { should respond_with(:redirect) }
        it { should set_the_flash }
      end
    end

    context 'invalid params' do
      let(:params) do
        if defined?(invalid_params)
          invalid_params
        else
          {}
        end
      end

      context 'response' do
        render_views

        before do
          put :update, params unless params.blank?
        end

        it { should respond_with(:success) unless params.blank? }
        it { should_not set_the_flash unless params.blank? }
        it { should render_template(:edit) unless params.blank? }
      end
    end
  end
end
