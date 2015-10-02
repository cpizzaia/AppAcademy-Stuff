require_relative "square"
require 'byebug'
class Board
  SQUARE_DELTAS = [
    [-1,1],
    [0,1],
    [1,1],
    [-1,0],
    [1,0],
    [-1,-1],
    [0,-1],
    [1,-1]
  ]
  BOMB = "*"
  attr_reader :result
  def initialize(size = 4,num_bombs = 8)
    @grid = Array.new(size) {Array.new(size) {Square.new(0)}}
    place_bombs(num_bombs)
    build_board_network
    assign_values
  end

  def select_square
    render
    puts "Enter a row"
    x = gets.chomp.to_i
    puts "Enter a column"
    y = gets.chomp.to_i
    puts "Do you want to flag? (y/n)"
    flag = gets.chomp.downcase
    if flag == 'y'
      flag_square(@grid[x][y])
    elsif !@grid[x][y].flagged
      show_square(@grid[x][y])
    else
      puts "Square is flagged"
      sleep(3)
    end

  end
  def flag_square(square)
    square.flag
  end
  def finished?
    self.won? || self.lost?
  end

  def won?
    @grid.each do |row|
      row.each do |square|
        return false if square.value != BOMB && square.revealed == false
      end
    end
    @result = "won"
    true
  end

  def lost?
    @grid.each do |row|
      row.each do |square|
        if square.value == BOMB && square.revealed == true
          @result = "lost"
          return true
        end
      end
    end
    false
  end

  def show_square(square)

    if square.value != 0
      square.show
    elsif square.revealed
      return nil


    else
      square.show

      children_array = square.children
      children_array.each do |child|

        show_square(child)
      end
    end
  end




  def render
    system("clear")
    var = @grid.map do |row|
      row.map do |column|
        if column.revealed
          if column.value == 0
            " "
          else
            column.value
          end
        elsif column.flagged
          "/"
        else
          "#"
        end
      end
    end
    puts var.map {|row| row.join(' ') + "\n"}
  end

  def squares_to_children(current_position, nearby_squares)
    x = current_position[0]
    y = current_position[1]
    nearby_squares.each do |square|
      @grid[x][y].add_child(@grid[square[0]][square[1]])
    end
  end

  def build_board_network
    (0..@grid.length-1).each do |i|
      (0..@grid.length-1).each do |j|
        current_position = [i, j]
        nearby_squares = surrounding_squares(current_position)
        squares_to_children(current_position, nearby_squares)
      end
    end
  end

  def assign_values

    @grid.each do |row|
      row.each do |square|

        next if square.value == BOMB
        children_array = square.children
        children_array.each do |child|
          square.value += 1 if child.value == BOMB
        end
      end
    end
  end







  def see_children(position) #debug method
    children_array = @grid[position[0]][position[1]].children
    children_array.each do |child|
      puts child
    end
  end

  def surrounding_squares(position)
    result = []
    SQUARE_DELTAS.each do |delta|
      temp = [position.first + delta.first, position.last + delta.last]

      result << [position.first + delta.first, position.last + delta.last] if in_range?(temp)
    end
    result
  end

  def in_range?(position)
    position.first.between?(0, @grid.length-1) && position.last.between?(0, @grid.length-1)
  end

  def place_bombs(num_bombs)
    placed_square = []
    while num_bombs != 0
      row = rand(0..@grid.length-1)
      col = rand(0..@grid.length-1)
      if !placed_square.include? [row, col]
        @grid[row][col].value = BOMB
        num_bombs -= 1
        placed_square << [row, col]
      end
    end
  end

  def reveal
    @grid.map do |row|
      row.map do |column|
        column.show
      end
    end
  end
end
