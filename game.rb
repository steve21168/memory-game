require_relative 'board'
require_relative 'card'
require_relative 'player'
require 'byebug'

class Game
  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = Player.new
  end

  def setup
    board.populate
  end

  def reaveal_and_render(previous_guess)
    system('clear')
    board.reveal(previous_guess)
    board.render
  end

  def play
    setup

    until board.won?
      board.render
      previous_guess = player.first_guess
      reaveal_and_render(previous_guess)


      second_guess = player.second_guess
      board.reveal(second_guess)

      board.render
      sleep(2)
      system('clear')

      unless board[previous_guess].face_value == board[second_guess].face_value
          board[previous_guess].flip
          board[second_guess].flip
      end
    end
    puts "You are the winner"
  end
end


game = Game.new
game.play
