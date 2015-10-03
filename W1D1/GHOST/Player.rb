class Player
  attr_reader :name, :letters, :type
  attr_accessor :number_of_losses

  def initialize(name, type = "human")
    @name = name
    @number_of_losses = 0
    @letters = ""
    @type = type
  end

  def append_letter
    @letters = "GHOST"[0..@number_of_losses-1] if @number_of_losses > 0
  end

  def cpu_choose_letter(fragment, dictionary)

    dictionary.each do |word|
      if word.length > fragment.length + 2 && word[0..fragment.length - 1] == fragment
        puts "letter chose: #{word[fragment.length]}"
        return word[fragment.length]
      end
    end


    dictionary.each do |word|
      if word.length > fragment.length + 1 && word[0..fragment.length - 1] == fragment
        puts "letter chose: #{word[fragment.length]}"
        return word[fragment.length]
      end
    end

  end

end
