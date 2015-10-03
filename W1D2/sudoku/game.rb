require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def play
    until @board.solved?
      @board.render
      puts "Select a row"
      row = gets.chomp.to_i
      puts "Select a column"
      col = gets.chomp.to_i
      puts "Select a number"
      num = gets.chomp

      if @board.board[row][col].given
        puts "Invalid move"
        sleep(1)
      else
        @board.board[row][col].value = num
      end
    end
    @board.render
    puts "YOU WIN!!!!!!!!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
