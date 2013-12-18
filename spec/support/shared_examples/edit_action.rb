shared_examples 'edit action' do
  render_views

  it { should respond_with(:success) }
  it { should render_template(:edit) }
  it { should_not set_the_flash }
end
