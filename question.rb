# Math question that is generated for players to guess. When the
# math question is generated, it auto picks the addends and stuff
# and calculates its answer
class Math_Question
  attr_reader :caption 
  attr_reader :answer
  
  def initialize()
    @num1 = rand 1..20
    @num2 = rand 1..30

    @caption = "What is #{@num1} plus #{@num2} ?"
    @answer = @num1 + @num2
  end
end