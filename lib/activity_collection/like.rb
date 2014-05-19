class ActivityCollection::Like < ActivityCollection::Base
  def likeable
    @collection.first.trackable.likeable
  end
end