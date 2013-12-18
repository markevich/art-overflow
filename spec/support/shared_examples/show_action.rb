shared_examples 'show action' do |factory_name|
  describe '#show' do
    render_views

    if factory_name
      let(:record) { create(factory_name) }

      before { get :show, :id => record.id }
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
