require_relative 'card'

class Board
  attr_reader :board

  def initialize(size = 2)
    @previous_matches = []
    @board = Array.new(size) {Array.new(size)}
    @cards = []
    populate
    render
  end

  def populate
    value_counter = 0
    previous_values = []
    until board_full?
      placed = 0
      until placed == 2
        x = rand(0...@board.size)
        y = rand(0...@board.size)
        if !previous_values.include? [x,y]
          @board[x][y] = Card.new(value_counter)
          previous_values << [x, y]
          placed += 1
        end
      end
      value_counter += 1
    end
    nil
  end

  def reveal(row, column)
    @board[row][column].show
    @cards << @board[row][column]
    render
  end

  def render
    system("clear")
    var = @board.map do |row|
      row.map do |column|
        column.facedown ? '#' : column.value
      end
    end
    puts var.map {|row| row.join(' ') + "\n"}
  end
  def match
    if @cards[0].value == @cards[1].value
      @cards[0].value = nil
      @cards[1].value = nil
      true
    else
      false
    end
  end
  def reset
    system("clear")
    var = @board.map do |row|
      row.map do |column|
        column.value.nil? ? ' ' : (column.hide; '#')
      end
    end
    @cards = []
    puts var.map {|row| row.join(' ') + "\n"}
  end




  def board_full?
    @board.none?{|array| array.include? nil}
  end
end
