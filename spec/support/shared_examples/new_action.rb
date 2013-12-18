shared_examples 'new action' do
  render_views

  it { should respond_with(:success) }
  it { should render_template(:new) }
  it { should_not set_the_flash }
end
