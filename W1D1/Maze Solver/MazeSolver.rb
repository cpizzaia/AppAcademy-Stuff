class MazeSolver
  attr_reader :maze
  def initialize(file)
    @maze = read_file(file)
    @current_pont = find_start
    @end_of_maze = false
  end
  def read_file(file)
    result = []
    File.foreach(file) do |line|
      result << []
      line.split("").each do |chr|
        result.last << chr unless chr == "\n"
      end
    end
    result
  end
  def find_start
    for i in 0..@maze.length-1
      for j in 0..@maze.length-1
        if @maze[i][j] == "S"
          return [i, j]
        end
      end
    end
  end
  def collision_detect
    #iterate right
    #iterate left
    #iterate up
    #iterate down

  end
  def check_position(row, column)
    if @maze[row][column] == "*"
      true
    elsif @maze[row][column] == "E"
      @end_of_maze = true
      true
    else
      false
    end
  end

  def iterate_right
    temp = @current_point
    i = temp[1]
    while(true)
      i += 1
      if check_position(temp[0], temp[1])
        break
      end
    end
  end




end
