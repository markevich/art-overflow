shared_examples 'create action' do |factory|
  describe "#create" do
    context 'correct params' do
      let(:params) { valid_params }

      context 'response' do
        before { post :create, params }

        it { should respond_with(:redirect) }
        it { should set_the_flash }

        it 'does not set errors for resource' do
          resource = assigns(factory || valid_params.keys.first)
          if resource && resource.errors.present?
            raise resource.errors.full_messages.inspect
          end
        end
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
        before { post :create, params }
        render_views

        it { should respond_with(:success) }
        it { should render_template(:new) }
        it { should_not set_the_flash }
      end
    end

  end
end
