class Ghost
  attr_accessor :current_player
  attr_reader :dictionary, :roundover, :players, :gameover, :count

  def initialize(fragment = "", *players)
    @players = players
    @current_player = @players.first
    @fragment = fragment
    @count = 0
    @roundover = false
    @gameover = false
    @dictionary = []
    dict_file = File.new("ghost-dictionary.txt", "r")
    dict_file.each_line { |line| @dictionary << line.chomp }
  end

  def play_round
    @roundover = false
    while true
      puts "#{@current_player.name}, guess a letter."

      if @current_player.type == "human"
        user_input = gets.chomp
        tmp_fragment = @fragment + user_input

        if tmp_fragment_in_dict?(tmp_fragment) == true && user_input.length == 1
          @fragment += user_input
          break
        else
          puts "invalid input"
        end
      else
        @fragment += @current_player.cpu_choose_letter(@fragment, @dictionary)
        tmp_fragment_in_dict?(@fragment)
        break
      end
    end

    puts "current fragment = #{@fragment}"

    if @roundover == true
      end_round
    else
      switch_player
    end
  end

  def tmp_fragment_in_dict?(tmp_fragment)
    @dictionary.each do |word|
      if word == tmp_fragment
        @roundover = true
        return true
      elsif word[0..tmp_fragment.length - 1] == tmp_fragment
        return true
      end
    end

    false
  end

  def switch_player
    if @count == @players.length - 1
      @count = 0
    else
      @count += 1
    end

    @current_player = @players[count]
  end

  def end_round
    puts "Round over! #{@current_player.name} loses the round"
    @fragment = ""
    @current_player.number_of_losses += 1
    @current_player.append_letter

    end_game?

    score_board
  end

  def end_game?
    if @current_player.letters == "GHOST"
      puts "#{@current_player.name} loses"
      @players.delete(@current_player)
      @gameover = true if @players.length == 1
      @count = 0
      @current_player = @players.first
    end
  end

  def score_board
    @players.each do |player|
      puts "#{player.name} number of losses = #{player.number_of_losses}"
      puts "#{player.name} letters are  #{player.letters}"
    end
  end

end
