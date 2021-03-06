require_relative 'hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if count == num_buckets
    bucket(key).insert(key, val)
    @count += 1
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each(&block)
    pairs = @store.inject([]) do |acc, bucket|
      acc + bucket.map { |link| [link.key, link.val] }
    end

    pairs.reject { |pair| pair[0].nil? }.each { |pair| block.call(*pair) }
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_map = inject([]) {|acc, pair| acc + [pair]}
    new_capacity = num_buckets * 2
    @store = Array.new(new_capacity) { LinkedList.new }
    @count = 0

    old_map.each do |key, value|
      set(key, value)
    end

    nil
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
