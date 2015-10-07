class Game

  attr_reader :board
  def initialize(disks, board = nil)
    @disks = disks
    @board = board
    if @board.nil?
      generate_board(disks)
    end
  end
  def generate_board(disks)
    @board = [
      [],
      [],
      []
    ]

    (1..disks).each do |i|
      @board[0] << i
    end
  end

  def render
    puts @board
    @board
  end

  def move(start_tower, finish_tower)
    start_tower -= 1
    finish_tower -= 1
    if board[start_tower].empty?
      puts "There are no disks on first tower."
    elsif board[finish_tower].empty? || board[start_tower].first < board[finish_tower].first
      disk = board[start_tower].shift
      board[finish_tower].unshift(disk)

    else
      raise "Cannot place a bigger piece on a smaller one"
      puts "Try a new move."
    end
  end

  def won?
    board == [[], [], [1,2,3]]
  end


end
