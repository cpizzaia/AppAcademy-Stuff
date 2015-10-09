class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(value)
    raise "Out of bounds" if !value.between?(0, @store.length)
    for i in 0..@store.length-1
      @store[i] = true if i == value
    end
    @store
  end

  def remove(value)
    for i in 0..@store.length-1
      @store[i] = false if i == value
    end
    value
  end

  def include?(value)
    @store[value] == true
  end
end
