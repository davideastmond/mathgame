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

  # This function alternates the player's turn when called
  def switchTurn
    if @currentTurn == @p1
      @currentTurn = @p2
    elsif @currentTurn == @p2
      @currentTurn = @p1
    end 
  end
  
  def docPlayer(player) 
    # This method subtracks a life from a player after having guessed incorrectly
    player.lives -= 1
  end

  def doGuess(currentPlayer, actualGuess, correctAnswer)
    if actualGuess == correctAnswer
      puts "#{currentPlayer.name}, correct!"
     else 
      puts "#{currentPlayer.name} Wrong response!"
      docPlayer(currentPlayer)
    end 
    
  end

  def showScore
    puts "P1: #{@p1.lives}/3  P2: #{@p2.lives}/3"
  end

  def gameDone?
    if @p1.lives <= 0
      puts "Player 2 wins with a score of #{@p2.lives}/3"
      return true
    elsif @p2.lives <= 0
      puts "Player 1 wins with a score of #{@p1.lives}/3"
      return true
    end
    return false
  end

  def start
    # start the game loop
    @gameIsOn = true
    while @gameIsOn
      # Create a math Question and prompt the current turn player
      currentQuestion = Math_Question.new
      puts "#{@currentTurn.name} : #{currentQuestion.caption}"
      response = gets.chomp.to_i
      doGuess(@currentTurn, response, currentQuestion.answer)
      if !gameDone?
        showScore
        switchTurn
      else
        showScore
        stop
        puts "--- GAME OVER ----"
        break
      end
    end
  end

  def stop
    @gameIsOn = false
  end
end