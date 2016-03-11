class Player

  def guess
    puts "Choose a position on the board in the form 'x,y'."
    guess_val = gets.chomp.split(',').map(&:to_i)
    validate_guess(guess_val)

    rescue
      puts "Guess must be two coordinates between 0 and 3"
    retry

    guess_val
  end

  def validate_guess(guess_val)
    guess_val.each do |val|
      if val < 0 || val > 3 || guess_val.length != 2
        raise "Invalid"
      end
    end
  end

end
