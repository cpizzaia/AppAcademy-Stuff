require_relative 'int_set'


class ResizingIntSet < IntSet

  attr_reader :count

  def initialize(size)
    super
    @count = 0
  end

  def capacity
    @store.length
  end

  def insert(value)
    resize! if @count >= capacity
    super
    @count += 1

    self
  end

  def resize!
    old_store = @store
    new_capacity = capacity * 2
    @store = Array.new(new_capacity) {[]}
    @count = 0

    old_store.flatten.each do |value|
      insert(value)
    end

    nil
  end


end
