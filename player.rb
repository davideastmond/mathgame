# Defines the player in the math game
class Player
  attr_accessor :name
  attr_reader :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
end
