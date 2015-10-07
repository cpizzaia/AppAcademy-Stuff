require 'card'

class Deck

  CARD_SUITS = {
    :hearts => '♡',
    :diamonds => '♢',
    :spades => '♤',
    :clubs => '♧'
  }
  CARD_VALUES = {
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13,
    :ace => 14
  }
  attr_reader :deck
  def initialize
    @deck = []
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        @deck << Card.new(CARD_VALUES[value], suit)
      end
    end
    @deck.shuffle
  end

  def draw(amount)
    result = []
    amount.times do
      result << @deck.shift
    end
    result
  end

end
