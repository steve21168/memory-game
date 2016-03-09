
class Computer
  attr_reader :known_cards, :previous_guess, :first_guess, :second_guess

  def initialize
    @known_cards = Hash.new { |hash,key| hash[key] = []}
    @previous_guess = nil
  end

  def find_pair
    known_cards.values.find {|value| value.length ==2}
  end


  def first_guess
    if find_pair.nil?
      pos = random_guess
      known_cards[board[pos].face_value] << pos
      previous_guess = pos
    else
      previous_guess = known_cards[board[pos].face_value].first
    end
  end

  def second_guess
    if find_pair.nil?
      pos = random_guess
      known_cards[board[pos].face_value] << pos
    else
      known_cards[board[pos].face_value].last
    end
  end

  def random_guess
    coordinates.sample
  end

  def coordinates
    coordinates = []

    (0..board.grid.size-1).each do |row|
      (0..board.grid.size-1).each do |col|
        coordinates << unless board[row, col].face_up
      end
    end
    coordinates
  end

end
