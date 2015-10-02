class Square
  attr_accessor :value
  attr_reader :revealed
  def initialize(value)
    @value = value
    @revealed = false
  end

  def show
    @revealed = true
  end
end
