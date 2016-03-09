class Card
  attr_accessor :face_value, :face_up


  def initialize(face_value)
    @face_up = false
    @face_value = face_value
  end

  def face_up?
    @face_up
  end

  def flip
    if face_up == false
      self.face_up = true
    else
      self.face_up = false
    end
  end

end
