require_relative 'board'
class Game
  def initialize(file_name = nil)
    if file_name.nil?
      @board = Board.new(4, 5)
    else
      load_game(file_name)
    end
  end


  def play
    until @board.finished?
      @board.select_square
      save_game
    end
    @board.render
    puts "game over you #{@board.result}, play again? (y,n)"
    user_input = gets.chomp
    if user_input.downcase == "y"
      @board = Board.new(4, 5)
      self.play
    end
  end

  def write_to_file
    yaml_grid = @board.to_yaml
    File.open("board.txt", "w") {|file| file.write(yaml_grid)}
  end

  def read_from_file(file_name)
    result = File.read(file_name)
    @board = YAML::load(result)
  end

  def load_game(file_name)
    read_from_file(file_name)
  end

  def save_game
    write_to_file
  end
end
