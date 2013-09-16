shared_examples_for 'likeable' do
  it { should have_many(:likes).dependent(:destroy) }
  it { should respond_to(:likes_count) }
end
