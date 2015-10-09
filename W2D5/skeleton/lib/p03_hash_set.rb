require_relative 'resizing_int_set'
require_relative 'hashing'

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(size)
    super
  end

  def include?(value)
    super(value.hash)
  end

  def insert(value)
    super(value.hash)
  end

  def index(value)
    super(value.hash)
  end

  def remove(value)
    super(value.hash)
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

end
