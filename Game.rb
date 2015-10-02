require_relative 'board'
class Game
  def initialize(board = Board.new(4, 1))
    @board = board
  end


  def play
    until @board.finished?
      @board.select_square
    end
    @board.render
    puts "game over you #{@board.result}"
  end
  def write_to_file
    yaml_grid = @board.to_yaml
    File.open("board.txt", "w") {|file| file.write(yaml_grid)}
  end

  def read_from_file(file_name)
    result = File.read(file_name)
    @board = YAML::load(result)
  end

end
