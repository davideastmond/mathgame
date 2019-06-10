require './question'
require './player'

# Game is initialized by adding the player objects into the game
# and then calling the start method to start the game's loop
class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def start
    # start the game loop
    while @p1.lives > 0 && @p2.lives > 0
      puts "loop has started"
    end
  end

  def stop
  end
end