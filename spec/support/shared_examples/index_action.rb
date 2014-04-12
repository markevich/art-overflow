shared_examples 'index action' do
  render_views

  it do
    should respond_with(:success)
    should render_template(:index)
    should_not set_the_flash
  end
end
