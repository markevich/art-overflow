class ActivityCollection::Manager
  def initialize(collection)
    @collection = collection
    @output = []
    prepare
  end

  def each
    @output.each do |elem|
      yield elem
    end
  end

  def to_partial_path
    'activities/collection'
  end

  private

  def prepare
    @collection.each_with_index do |element, index|
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
        @output << @new_collection
        @new_collection = nil
      end
    end
  end

  def next_element
    @collection[@index + 1]
  end

  def next_element_exists?
    !next_element.nil?
  end

  def next_element_same_as_current?
    next_element.key == @element.key && next_element.recipient == @element.recipient
  end
end