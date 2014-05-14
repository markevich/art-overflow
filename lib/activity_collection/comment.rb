class ActivityCollection::Comment < ActivityCollection::Base
  def commentable
    @collection.first.trackable.commentable
  end
end