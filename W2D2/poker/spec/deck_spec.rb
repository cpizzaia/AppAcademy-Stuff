require 'deck'
require 'rspec'

describe 'Deck' do
  let (:new_deck) { Deck.new }

  describe '#initialize' do
    it 'initializes a deck of 52 cards' do
      expect(new_deck.deck.length).to eq(52)
    end
  end

  describe "#draw" do
    it "draws the amount specified from the deck" do
      new_deck.draw(10)
      expect(new_deck.deck.length).to eq(42)
    end
  end



end
