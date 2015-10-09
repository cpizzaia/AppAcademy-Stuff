class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil, prev = nil)
    @key, @val, @next, @prev = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = Link.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail
  end

  def empty?
    first.nil?
  end

  def get(key)
    link = find { |link| link.key == key }
    link.nil? ? nil : link.val
  end

  def include?(key)
    !get(key).nil?
  end

  def insert(key, val)
    old_last = last
    new_link = Link.new(key, val)
    old_last.next = new_link
    @tail = new_link
    new_link.prev = old_last
    new_link
  end

  def remove(key)
    link = find.with_index { |link| link.next.nil? || link.key == key }
    @tail = link.prev if link == @tail
    link.prev.next = link.next
    link
  end

  def each(&block)
    current_link = first
    until current_link.nil?
      block.call(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
