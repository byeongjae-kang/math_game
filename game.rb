class Game
  attr_accessor :current_player, :player1, :player2, :question

  def initialize(question, player1, player2)
    self.current_player = 1
    self.player1        = player1
    self.player2        = player2
    self.question       = question
  end

  def change_player
    self.current_player = (self.current_player == 1) ? 2 : 1
  end

  def display_question
    puts "Player #{self.current_player}: #{self.question.create_question}"
    print "> "
    self.question.get_answer
  end

  def display_result
    result = nil

    if self.question.correct? 
      result = "YES! You are correct."
    else
      result = "Seriously? No!"

      self.current_player == 1 ? self.palyer1.lose_life : self.player2.lose_life

    end

    puts "Player #{self.current_player}: #{result}"
    puts "P1: #{self.player1.life}/3 vs P2: #{self.player2.life}/3"

  end

  def winner?

    winner = self.player1.life > self.player2.life ? self.player1 : self.player2

    puts "Player #{winner.name} wins with score of #{winner.get_remaining_life_to_string}"
    puts "----- GAME OVER -----"
    puts "Good bye!"

  end

  def play 
    display_question
    display_result

    while self.player1.life > 0 && self.player2.life > 0
      self.change_player
      puts '----- NEW TURN -----'
      display_question
      display_result
    end

    winner?
  end

end