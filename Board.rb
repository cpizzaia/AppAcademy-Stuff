require_relative "square"
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
  def initialize(size = 4,num_bombs = 8)
    @grid = Array.new(size) {Array.new(size) {Square.new(' ')}}

    place_bombs(num_bombs)
  end
  def render
    system("clear")
    var = @grid.map do |row|
      row.map do |column|
        column.revealed ? column.value : "#"
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
        @grid[row][col].value = "*"
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
