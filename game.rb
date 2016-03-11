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

  def reaveal_and_render(guess)
    system('clear')
    board.reveal(guess)
    board.render
  end

  def play
    setup

    until board.won?
      board.render

      first_guess = player.guess
      reaveal_and_render(first_guess)

      second_guess = player.guess
      reaveal_and_render(second_guess)

      sleep(2)
      system('clear')

      unless board[first_guess].face_value == board[second_guess].face_value
          board[first_guess].flip
          board[second_guess].flip
      end
    end
    puts "You are the winner"
  end
end


game = Game.new
game.play
