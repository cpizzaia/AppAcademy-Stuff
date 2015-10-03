require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder
KNIGHT_DELTAS = [
  [-2,-1],
  [-2,1],
  [-1, -2],
  [-1, 2],
  [2, -1],
  [2, 1],
  [1, -2],
  [1, 2]
]
  def initialize(position = [0,0])
    @starting_position = PolyTreeNode.new(position)
    @visited_positions = [@starting_position.value]
  end

  def build_move_tree
    move_queue = [@starting_position]
    until move_queue.empty?
      node = move_queue.shift
      new_nodes = self.new_move_positions(node.value)
      @visited_positions += new_nodes
      new_nodes.map! do |new_node|
        PolyTreeNode.new(new_node)
      end
      new_nodes.each do |new_node|
        node.add_child(new_node)
      end
      move_queue += new_nodes
    end
  end

  def self.valid_moves(position)
    positions = KnightPathFinder.generate_positions(position)
    positions.reject  {|pos| pos[0] < 0 || pos[1] < 0|| pos[0] > 7 || pos[1] > 7}
  end

  def new_move_positions(position)
    positions = KnightPathFinder.valid_moves(position)
    positions.reject  {|pos| @visited_positions.include? pos}
  end

  def self.generate_positions(position)
    result = []
    x = position[0]
    y = position[1]
    KNIGHT_DELTAS.each do |constant|
      result << [x + constant[0], y + constant[1]]
    end
    result
  end
  def find_path(end_position)
    print trace_path_back(@starting_position.bfs(end_position))
  end
  def trace_path_back(last_node)
    return [] << @starting_position.value if @starting_position == last_node
    trace_path_back(last_node.parent) << last_node.value
  end
end
