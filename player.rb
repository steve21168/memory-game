class Player
  attr_reader :player_guess, :first_guess, :second_guess, :previous_guess

  def first_guess
    puts "Choose a position on the board in the form 'x,y'."
    gets.chomp.split(',').map(&:to_i)
  end

  def second_guess
    puts "Choose a position on the board in the form 'x,y'."
    gets.chomp.split(',').map(&:to_i)
  end

end
