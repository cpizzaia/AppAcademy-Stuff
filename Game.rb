class Game
  def initialize(board = Board.new(20, 1))
    @board = board
  end

  def play
    until @board.finished?
      @board.select_square
    end
    @board.render
    puts "game over you #{@board.result}"
  end

end
