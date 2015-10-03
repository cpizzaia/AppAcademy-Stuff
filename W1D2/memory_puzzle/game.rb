require_relative 'board'
require_relative 'card'

class Game
attr_reader :game_over

  def initialize(board, *players)
    @game_over = false
    @players = players
    @board = board
    @current_player = @players.first
  end
  def change_player
    @players.rotate!
    @current_player = @players.first
  end
  def play_turn
    if @current_player.type == :human
      i=0
      while(i<2)
        puts "Enter a row"
        row = gets.chomp.to_i
        puts "enter a column"
        column = gets.chomp.to_i
        if @board.board[row][column].value.nil?
          puts "invalid move"
          i -= 1
        else
          @board.reveal(row, column)
        end
        i += 1
      end
    else
      choices = []
      @board.board.each.with_index do |row, i|
        row.each.with_index do |column, j|
          choices << [i, j] unless column.value.nil?
        end
      end
      2.times do
        choice = choices.shuffle!.pop
        @board.reveal(choice[0], choice[1])
      end
    end
    if @board.match
      puts "match"
      @current_player.points += 1
    else
      change_player
    end
    sleep(2)
    @board.reset
    game_over?
  end

  def game_over?
    if @board.board.all?{|row| row.all? {|col| col.value.nil?}}
      @game_over = true
      winner = @players.sort_by{|player| player.points}.last.name
      puts "Game Over! The winner is #{winner}"
    end
  end



end
