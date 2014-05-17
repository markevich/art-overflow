class ActivityCollection::Base
  include Enumerable
  
  def initialize(element)
    @collection = [element]
  end

  def each
    @collection.each do |element|
      yield element.trackable
    end
  end

  def add(element)
    @collection << element
  end

  def to_partial_path
    "activities/#{self.class.name.demodulize.downcase}_collection"
  end

  def first_three_owners
    @collection[0..2].compact.map(&:owner)
  end

  def count
    @collection.count
  end

  def created_at
    @collection.last.created_at
  end
end