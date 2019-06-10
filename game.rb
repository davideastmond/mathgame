require './question'
require './player'

# Game is initialized by adding the player objects into the game
# and then calling the start method to start the game's loop
class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @gameIsOn = false
    @currentTurn = @p1
  end

  def switchTurn
    if @currentTurn == @p1
      @currentTurn = @p2
    elsif @currentTurn == @p2
      @currentTurn = @p1
    end 
  end

  def start
    # start the game loop
    @gameIsOn = true
    while @gameIsOn
      # Create a math Question and prompt the current turn player
      currentQuestion = Math_Question.new
      puts "#{@currentTurn.name} : #{currentQuestion.caption}"
      response = gets.chomp

    end
  end

  def stop
    @gameIsOn = false
  end
end