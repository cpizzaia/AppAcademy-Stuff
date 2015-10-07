require 'hand'
require 'deck'
require 'rspec'
require 'card'

describe 'Hand' do
  let (:new_deck) { Deck.new }
  let (:new_hand) { Hand.new( new_deck ) }
  let (:low_value_hand) {Hand.new(new_deck, [Card.new(2, :hearts), Card.new(8, :spades), Card.new(5, :clubs), Card.new(11, :diamonds), Card.new(14, :hearts)])}
  let (:royal_flush_hand) { Hand.new(new_deck, [
    Card.new(14),
    Card.new(13),
    Card.new(11),
    Card.new(12),
    Card.new(10)
  ]) }

  describe '#initialize' do

    it 'initializes a hand of 5 cards from the top of the deck' do
      expect(new_hand.hand.length).to eq(5)
      expect(new_deck.deck.length).to eq(47)
    end
  end




  describe "#royal_flush?" do

    it "checks if you have a royal flush" do
      expect(royal_flush_hand.royal_flush?).to be true
      expect(low_value_hand.royal_flush?).to be false
    end
  end

  describe "#straight_flush?" do

    it "returns true if you have a straight flush" do
      expect(royal_flush_hand.straight_flush?).to eq([14, :straight_flush])
      expect(low_value_hand.royal_flush?).to be false
    end
  end

  describe "#four_of_a_kind?" do

    it "returns true if you have 4 cards of the same value" do
      four_of_a_kind_array = (Array.new (4) {Card.new(1)}) + (Array.new(1) {Card.new(2, :hearts)})
      four_of_a_kind_hand = Hand.new(new_deck, four_of_a_kind_array)
      expect(four_of_a_kind_hand.four_of_a_kind?).to eq([1, :four_of_a_kind])
    end

    it "returns false if you don't have 4 of a kind" do
      expect(royal_flush_hand.four_of_a_kind?).to be false
    end
  end

  describe "#full_house?" do

    it "checks if you have a full house" do
      full_house_array = three_of_a_kind_array = (Array.new (3) {Card.new(1)}) + (Array.new(2) {Card.new(2, :hearts)})
      full_house_hand = Hand.new(new_deck, full_house_array)
      expect(full_house_hand.full_house?).to eq([1, :full_house])
      expect(low_value_hand.full_house?).to be false
    end
  end

  describe "#flush?" do

    it "checks if the entire hand is the same suit" do
      card_array2 = (Array.new (3) {Card.new(1, :spades)}) + (Array.new(2) {Card.new(1, :hearts)})
      different_suit_hand = Hand.new(new_deck, card_array2)
      expect(royal_flush_hand.flush?).to eq([14, :flush])
      expect(different_suit_hand.flush?).to be false
    end
  end

  describe "#straight?" do

    it "it checks if you have straight" do
      card_array1 = Array.new(5) {Card.new(1, :spades)}

      same_suit_hand = Hand.new(new_deck, card_array1)


      expect(same_suit_hand.straight?).to be false
      expect(royal_flush_hand.straight?).to eq([14, :straight])
    end
  end

  describe "#three_of_a_kind?" do

    it "returns true if you have 3 cards of the same value" do
      three_of_a_kind_array = (Array.new (3) {Card.new(1)}) + (Array.new(2) {Card.new(2, :hearts)})
      three_of_a_kind_hand = Hand.new(new_deck, three_of_a_kind_array)
      expect(three_of_a_kind_hand.three_of_a_kind?).to eq([1, :three_of_a_kind])
    end

    it "returns false if you don't have 3 of a kind" do
      expect(royal_flush_hand.three_of_a_kind?).to be false
    end
  end

  describe "#two_pair?" do

    it "checks if you have 2 pairs" do
      two_pair_array = (Array.new (2) { Card.new(1) }) + (Array.new (2) { Card.new(2)} ) + [Card.new(3)]
      two_pair_hand = Hand.new(new_deck, two_pair_array)
      expect(two_pair_hand.two_pair?).to be_truthy
    end

    it "does not return true for a low value hand" do
      expect(low_value_hand.two_pair?).to be false
    end

  end

  describe "#pair" do
    it "checks if you have a pair" do
      pair_array = (Array.new (2) { Card.new(1) }) + [Card.new(3), Card.new(4), Card.new(5)]
      pair_hand = Hand.new(new_deck, pair_array)
      expect(pair_hand.pair?).to be_truthy
    end

    it "does not return true for a low value hand" do
      expect(low_value_hand.two_pair?).to be false
    end
  end

  describe "#high_card" do
    it "returns the highest card in your hand" do
      expect(low_value_hand.high_card).to eq(14)
    end
  end




end
