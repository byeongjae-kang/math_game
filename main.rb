
require './game'
require './question'
require './player'

player1 = Player.new(1)
player2 = Player.new(2)
question = Question.new
game = Game.new(question, player1, player2)

game.play

