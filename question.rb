class Question
  attr_accessor :random_number1, :random_number2, :answer

  def create_question
    self.random_number1 = rand(1..20)
    self.random_number2 = rand(1..20)
    self.answer = nil
    
    "What does #{self.random_number1} plus #{self.random_number2} equal?"
  end

  def get_answer
    self.answer = gets.chomp.to_i
  end

  def correct? 
    (self.random_number1 + self.random_number2) == self.answer
  end

end
