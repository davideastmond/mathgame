require './question'
require './player'

# Game is initialized by adding the player objects into the game
# and then calling the start method to start the game's loop

class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @game_is_on = false
    @current_turn = @p1
  end

  def start
    # start the game loop
    @game_is_on = true
    while @game_is_on
      # Create a math question and prompt the current turn player for input
      current_question = MathQuestion.new
      puts "#{@current_turn.name} : #{current_question.caption}"
      response = gets.chomp.to_i
      do_guess(@current_turn, response, current_question.answer)
      if !game_done?
        show_score
        switch_turn
      else
        show_score
        stop
        puts "--- GAME OVER ----"
        break
      end
    end
  end

  private
  # This function alternates the player's turn when called
  def switch_turn
    if @current_turn == @p1
      @current_turn = @p2
    elsif @current_turn == @p2
      @current_turn = @p1
    end 
  end
  
  def doc_player(player) 
    # This method subtracks a life from a player after having guessed incorrectly
    player.lives -= 1
  end

  # Handles the guessing of each player and subtracts a life for any incorrect repsonse
  def do_guess(current_player, actualGuess, correct_answer)
    if actualGuess == correct_answer
      puts "#{current_player.name}, correct!"
      puts ""
     else 
      puts "#{current_player.name} Wrong response!"
      puts ""
      doc_player(current_player)
    end 
    
  end
  
  # Simply shows the scoreboard
  def show_score
    puts "P1: #{@p1.lives}/3  P2: #{@p2.lives}/3"
  end

  # Evaluates the status of game and displays a final message. If this function
  # returns true, the game will end
  def game_done?
    if @p1.lives <= 0
      puts "Player 2 wins with a score of #{@p2.lives}/3"
      return true
    elsif @p2.lives <= 0
      puts "Player 1 wins with a score of #{@p1.lives}/3"
      return true
    end
    return false
  end

  def stop
    @game_is_on = false
  end
end