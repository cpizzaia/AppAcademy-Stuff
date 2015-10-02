require_relative "square"
class Board
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
