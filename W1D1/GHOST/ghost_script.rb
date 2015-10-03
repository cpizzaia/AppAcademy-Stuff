#!/usr/bin/env ruby

require_relative 'ghost'
require_relative 'player'

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Ephraim")
  player2 = Player.new("Cody")
  player3 = Player.new("John", "cpu")

  game = Ghost.new("", player1, player2, player3)

  while(game.gameover == false)
    game.play_round
  end
end
