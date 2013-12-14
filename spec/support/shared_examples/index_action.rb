shared_examples 'index action' do
  render_views

  it { should respond_with(:success) }
  it { should render_template(:index) }
  it { should_not set_the_flash }
  # it { expect(controller.send(:collection)).to_not be_empty }
end
