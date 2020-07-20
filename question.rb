class Question
  attr_accessor :answer, :prompt
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    @prompt = "What is #{@num1} + #{@num2}?"
  end
end