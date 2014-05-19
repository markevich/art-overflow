class ActivityCollection::Picture < ActivityCollection::Base
  def owner_name
    @collection.first.trackable.user.name
  end

  def owner
    @collection.first.trackable.user
  end
end