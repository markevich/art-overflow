shared_context 'with enabled observers' do |*observers|
  before(:all) do
    observers.each do |observer|
      ActiveRecord::Base.observers.enable(observer)
    end
  end

  observers.each do |observer|
    name = observer.name.underscore.gsub('/', '_')
    let!(name) { observer.instance }
  end
end
