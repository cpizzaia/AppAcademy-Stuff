class Player
  attr_reader :name, :type
  attr_accessor :points

  def initialize(name, type = :human)
    @name = name
    @type = type
    @points = 0
  end
end
