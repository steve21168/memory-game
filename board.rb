class Board
 attr_reader :grid, :cards, :game_size

 BOARD_MARKS = :x, :y, :w, :k, :o, :p, :z, :u

 def self.generate_cards
   cards_arr = []

   BOARD_MARKS.each do |mark|
     2.times { cards_arr << Card.new(mark) }
   end
   cards_arr
 end

  def initialize(size=4)
    @grid = Array.new(size) { Array.new(size) }
    @cards = Board.generate_cards.shuffle
    @game_size = size
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
    (0...grid.size).each do |row|
      (0...grid.size).each do |col|
        pos = [row, col]
        self[pos] = cards.pop
      end
    end
  end

  def render
    (0...grid.size).each do |row|
      (0...grid.size).each do |col|
        pos = [row,col]
        unless self[pos].face_up?
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
    grid.flatten.all? { |card| card.face_up? }
  end
end
