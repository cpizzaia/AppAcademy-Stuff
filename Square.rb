
require 'byebug'

class Square
  attr_accessor :value
  attr_reader :parent, :children, :revealed
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
    @revealed = false
  end

  def show
    @revealed = true
  end




  def parent=(parent)
    if !self.parent.nil?
      self.parent.children.delete(self)
    end
      @parent = parent
    if !self.parent.nil?
      self.parent.children << self
    end
  end

  def add_child(node)
    #node.parent = self
    @children << node
  end

  def remove_child(node)
    raise "error" if !self.children.include?(node)
    node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children_array = self.children.dup
    children_array.each do |child|
      results = child.dfs(target_value)
      return results unless results.nil?
    end

    nil
  end

  def bfs(target_value)
    nodes = [self]
    while !nodes.empty?
      temp = nodes.shift
      return temp if temp.value == target_value
      nodes += temp.children
    end

    nil
  end
end
