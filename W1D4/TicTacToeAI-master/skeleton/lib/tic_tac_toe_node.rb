require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.winner != evaluator
    nodes = self.children
    nodes.each do |node|
      return true if node.losing_node?(node.next_mover_mark)
    end
  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    for i in 0..2
      for j in 0..2
        if @board.empty?([i,j])
          @next_mover_mark == :x ? nodes << TicTacToeNode.new(@board.dup, :o, [i, j]) : nodes << TicTacToeNode.new(@board.dup, :x, [i, j])
        end
      end
    end
    nodes
  end
end
