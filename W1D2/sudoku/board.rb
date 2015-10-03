require "colorize"
require_relative 'Tile'
class Board
  attr_reader :board

  def initialize
    @board = File.readlines('./puzzles/sudoku1.txt').map do |line|
      line.chomp.chars.map {|char| char.to_i.zero? ? Tile.new(char, false) : Tile.new(char, true)}
     end
  end
  def render
    system("clear")
    var = @board.map do |row|
      row.map do |column|
        column.given ? column.value.colorize(:red) : column.value
      end
    end
    for i in 0..@board.length-1
      var[i].insert(3, "|")
      var[i].insert(7, "|")
    end
    var.insert(3, Array.new(11) {"-"})
    var.insert(7, Array.new(11) {"-"})

    puts var.map {|row| row.join(' ') + "\n"}
  end

  def solved?
    @board.all? {|row| row.map {|tile| tile.value}.sort == ('1'..'9').to_a} &&
    @board.transpose.all? {|row| row.map {|tile| tile.value}.sort == ('1'..'9').to_a}
  end


  ###Bonus: Solver###
  def solve
    for row in 0..@board.length-1
      for column in 0..@board.length-1
        num = 1
        while(num < 10)
          if @board[row][column].value != "0"
            break
          else
            if !(check_area(row, column, num) || check_row(row, num) || check_column(column, num))
              @board[row][column].value = num.to_s
            else
              num += 1
            end
          end
        end
      end
    end
  end


  def check_area(row, column, num)
    num = num.to_s
    if row < 3 && column < 3
      (0..2).map{|x| (0..2).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif row < 3 && column > 3 && column < 6
      (0..2).map{|x| (3..5).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif row < 3
      (0..2).map{|x| (6..8).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif row < 6 && column < 3
      (3..5).map{|x| (0..2).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif row < 6 && column > 3 && column < 6
      (3..5).map{|x| (3..5).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif row < 6
      (3..5).map{|x| (6..8).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif column < 3
      (6..8).map{|x| (0..2).map{|y| @board[x][y].value}}.flatten.include?(num)
    elsif column > 3 && column < 6
      (6..8).map{|x| (3..5).map{|y| @board[x][y].value}}.flatten.include?(num)
    else
      (6..8).map{|x| (6..8).map{|y| @board[x][y].value}}.flatten.include?(num)
    end
  end

  def check_column(column, num)
    num = num.to_s
    for i in 0..@board.length-1
      if @board[i][column].value == num
        return true
      end
    end
    false
  end

  def check_row(row, num)
    num = num.to_s
    for i in 0..@board.length-1
      if @board[row][i].value == num
        return true
      end
    end
    false
  end



end
