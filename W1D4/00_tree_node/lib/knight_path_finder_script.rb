require_relative 'knight_path_finder'
require_relative '00_tree_node'

x = KnightPathFinder.new
x.build_move_tree
x.find_path([6,2])
