require_relative 'Board'

x = Board.new(20)
x.build_board_network
x.see_children([10,10])
