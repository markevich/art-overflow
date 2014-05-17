class ActivityCollection::Manager
  include Enumerable

  def initialize(collection)
    @grouped_collection = collection.group_by { |e| activity_object(e.trackable) }.values.flatten
    @activities_collections = []
    prepare
  end

  def each(&block)
    @activities_collections.each(&block)
  end

  def to_partial_path
    'activities/collection'
  end

  private

  def prepare
    @grouped_collection.each_with_index do |element, index|
      @element = element
      @index = index

      if @new_collection
        @new_collection.add(element)
      else
        @new_collection ||= "ActivityCollection::#{element.trackable.class.name}".constantize.new(element)
      end

      if next_element_exists? && next_element_same_as_current?
        next
      else
        @activities_collections << @new_collection
        @new_collection = nil
      end
    end
  end

  def next_element
    @grouped_collection[@index + 1]
  end

  def next_element_exists?
    !next_element.nil?
  end

  def next_element_same_as_current?
    next_element.key == @element.key &&
      next_element.recipient == @element.recipient &&
      (picture_upload? || activity_on_same_object?)
  end

  def picture_upload?
    next_element.trackable.is_a?(::Picture)
  end

  def activity_on_same_object?
    if next_element.trackable_type == @element.trackable_type
      activity_object(@element.trackable) == activity_object(next_element.trackable)
    end
  end

  def activity_object(trackable)
    case trackable
    when ::Like
      trackable.likeable
    when ::Follow
      trackable.followable
    when ::Comment
      trackable.commentable
    when ::Picture
      trackable
    end
  end
end