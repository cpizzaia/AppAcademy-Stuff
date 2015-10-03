require_relative 'card'
require_relative 'board'
require_relative 'game'
require_relative 'player'

player1 = Player.new("Cody")
player2 = Player.new("CPU", :computer)
x = Game.new(Board.new, player1, player2)
while !x.game_over
  x.play_turn
end
