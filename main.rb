require './game'
require './player'
require './question'

# Create two players
P1 = Player.new("Player 1")
P2 = Player.new("Player 2")

# Create the game
game = Game.new(P1, P2)

game.start