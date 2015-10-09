class IntSet
  def initialize(size = 20)
    @store = Array.new(size) {[]}
  end

  def include?(value)
    index = index(value)
    @store[index].include?(value)
  end

  def insert(value)
    index = index(value)
    @store[index] << value
  end

  def index(value)
    value % @store.length
  end

  def remove(value)
    bucket = @store[index(value)]
    (0..bucket.length - 1).each do |i|
      bucket.delete_at(i) if value == bucket[i]
    end

    value
  end
end
