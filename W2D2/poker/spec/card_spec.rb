require 'rspec'
require 'card'


describe "Card" do

  let(:card) {Card.new(:ace,:spades)}

  describe "#initialize" do

    it "creates a card with a suit and value" do
      expect(card.suit).to eq(:spades)
      expect(card.value).to eq(:ace)
    end
  end
end
