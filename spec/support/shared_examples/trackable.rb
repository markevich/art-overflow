shared_examples_for 'trackable' do |factory_name|

  # check only that some activities were created and destroyed.
  # hard to create common test because of chain of factories creating each other
  it do
    model_object = build(factory_name)

    expect do
      PublicActivity.with_tracking do
        model_object.save
      end
    end.to change(PublicActivity::Activity, :count).from(0)

    expect do
      PublicActivity.with_tracking do
        model_object.destroy
      end
    end.to change(PublicActivity::Activity, :count).to(0)
  end
end
