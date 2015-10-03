class Card
  attr_reader :facedown
  attr_accessor :value

  def initialize(value)
    @value = value
    @facedown = true
  end

  def show
    @facedown = false
  end

  def hide
    @facedown = true
  end

end
