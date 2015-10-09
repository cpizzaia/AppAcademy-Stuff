class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count, :capacity

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @capacity = capacity
  end

  def [](i)
    return nil if i > capacity - 1
    @store[i]
  end

  def []=(i, val)
    @store[i] = val
  end

  def include?(val)
  end

  def push(val)
    @store[count] = val
    @count += 1
  end

  def unshift(val)
    (count + 1).times do |i|
      val, @store[i] = @store[i], val
      i += 1
    end
  end

  def pop

  end

  def shift
  end

  def first
    @store[0]
  end

  def last
    @store[count - 1]
  end

  def each
    count.times do |i|
      yield @store[i]
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
