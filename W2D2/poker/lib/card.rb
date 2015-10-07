class Card

  attr_reader :suit, :value

  def initialize(value, suit = :spades)
    @suit = suit
    @value = value
  end

end
