require 'byebug'
def windowed_max_range(arr, window_size) #2n^2
  current_max_range = nil
  i = 0
  j = window_size - 1
  while j < arr.length
    nest_arr = arr[i..j]
    current_range = nest_arr.max-nest_arr.min
    if current_max_range.nil? || current_max_range < current_range
      current_max_range = current_range
    end
    i += 1
    j += 1
  end
  current_max_range
end

class Cell
  attr_reader :max, :min, :value

  def initialize(value, min, max)
    @max = max
    @min = min
    @value = value
  end
end

class MyStack
  attr_reader :max, :min
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop.value
    unless empty?
      @max = @store[-1].max
      @min = @store[-1].min
    else
      @max = nil
      @min = nil
    end

  end

  def push(value)
    if !@max.nil? && @max < value
      @max = value
    end
    if !@min.nil? && @min > value
      @min = value
    end
    @store.push(Cell.new(value, @min, @max))
  end

  def peek
    @store.last.value
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end
end

class StackQueue
  attr_reader :size

  def initialize(size)
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
    @size = size
  end

  def max
    if !@dequeue_stack.max.nil? && !@enqueue_stack.max.nil?
      @enqueue_stack.max > @dequeue_stack.max ? @enqueue_stack.max : @dequeue_stack.max
    elsif @dequeue_stack.max.nil?
      @enqueue_stack.max
    else
      @dequeue_stack.max
    end
  end

  def min
    if !@dequeue_stack.min.nil? && !@enqueue_stack.min.nil?
      @enqueue_stack.min < @dequeue_stack.min ? @enqueue_stack.min : @dequeue_stack.min
    elsif @dequeue_stack.min.nil?
      @enqueue_stack.min
    else
      @dequeue_stack.min
    end
  end

  def enqueue(value)
    @enqueue_stack.push(value)
  end

  def dequeue
    if @dequeue_stack.empty?
      stack_transfer
      @dequeue_stack.pop

    end

  end

  def full?
    @enqueue_stack.size + @dequeue_stack.size == size
  end

  def stack_transfer
    size.times do
      @dequeue_stack.push(@enqueue_stack.pop)
    end
  end

  def empty?
    @enqueue_stack.empty? && @dequeue_stack.empty?
  end
end

def windowed_max_range2(arr,window_size)
  max_range = nil
  stack_queue = StackQueue.new(window_size)


  arr.each_with_index do |el|
    byebug
    stack_queue.dequeue if stack_queue.full?
    stack_queue.enqueue(el)
    curr_range = stack_queue.max - stack_queue.min unless stack_queue.max.nil? || stack_queue.min.nil?
    if !max_range.nil? && curr_range > max_range
      max_range = curr_range
    end

  end
  max_range
end
