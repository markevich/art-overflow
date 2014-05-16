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
    next_element.key == @element.key && next_element.recipient == @element.recipient
  end
end