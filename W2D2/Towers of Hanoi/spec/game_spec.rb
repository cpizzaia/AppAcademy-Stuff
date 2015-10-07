require 'rspec'
require 'game'


describe "Game" do
  let(:game) { Game.new(3) }

  describe "#initialize" do
    it "creates a board with all the disks on the left side" do
      expect(game.board).to eq([
        [1,2,3],
        [],
        []
      ])
    end
  end

  describe "#render" do
    it "returns a two dimensional array of values" do
      expect(game.render).to eq(game.board)
    end
    it "doesn't modify the board" do
      dupped_game = game.dup
      expect(dupped_game.render).to eq(game.board)
    end
  end

  describe "#move" do
    it "takes two towers as input" do
      expect {game.move(1,2)}.not_to raise_error
    end
    it "changes the position of the disks on the board" do
      game.move(1,2)
      expect(game.board).to eq([
        [2,3],
        [1],
        []
      ])
    end
    it "does not allow you to place a bigger disk on a smaller one" do
      game.move(1,2)
      expect{game.move(1,2)}.to raise_error
    end
  end

  describe "#won?" do
    it "returns true if the 3rd tower has all the disks on it" do
      game = Game.new(3, [[], [], [1,2,3]])
      expect(game.won?).to be true
    end
    
    it "returns false for all other states" do
      expect(game.won?).to be false
    end

  end
end
