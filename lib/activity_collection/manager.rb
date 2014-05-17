class ActivityCollection::Manager
  include Enumerable

  def initialize(activerecord_collection)
    @activerecord_collection = activerecord_collection
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
    @activerecord_collection.each_with_index do |element, index|
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
    @activerecord_collection[@index + 1]
  end

  def next_element_exists?
    !next_element.nil?
  end

  def next_element_same_as_current?
    next_element.key == @element.key &&
      next_element.recipient == @element.recipient &&
      activity_on_same_object?
  end

  def activity_on_same_object?
    if next_element.trackable_type == @element.trackable_type
      case @element.trackable
      when Like
        @element.trackable.likeable == next_element.trackable.likeable
      when Follow
        @element.trackable.followable == next_element.trackable.followable
      when Comment
        @element.trackable.commentable == next_element.trackable.commentable
      when Picture
        @element.trackable == next_element.trackable
      end
    end
  end
end