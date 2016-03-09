class Board
 attr_reader :grid, :cards, :game_size

 BOARD_MARKS = :x, :y, :w, :k, :o, :p, :z, :u

  def initialize(size=4)
    @grid = Array.new(size) {Array.new(size)}
    @cards = []
    @game_size = size
  end

  def coordinates
    coordinates = []

    (0...grid.size).each do |row|
      (0...grid.size).each do |col|
        coordinates << [row, col]
      end
    end
    coordinates
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos, mark)
    x,y = pos
    grid[x][y] = mark
  end

  def populate
    shuffled_coordinates = coordinates.shuffle
    #debugger
    cards.each_with_index do |card, index|
      pos = shuffled_coordinates[index]
      self[pos] = card
    end
  end

  def generate_cards
    BOARD_MARKS.each do |mark|
      2.times { @cards << Card.new(mark) }
    end

  end

  def render
    (0...grid.size).each do |row|
      (0...grid.size).each do |col|
        pos = [row,col]
        if self[pos].face_up == false
          print '[ ]'
        else
          print "[#{self[pos].face_value}]"
        end
      end
      print "\n"
    end
  end

  def reveal(user_guess)
    pos = user_guess
    self[pos].flip
  end

  def won?
    grid.flatten.all? { |card| card.face_up }
  end
end
