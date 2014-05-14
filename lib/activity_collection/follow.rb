class ActivityCollection::Follow < ActivityCollection::Base
  def followable
    @collection.first.trackable.followable
  end
end