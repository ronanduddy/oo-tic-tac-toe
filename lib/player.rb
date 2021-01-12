require_relative 'coordinate'

class Player
  def initialize(marker)
    @marker = marker
  end

  def random_move
    Coordinate.random
  end

  def move(value)
    @coordinate = Coordinate.new(value)

    self
  end

  def valid?
    @coordinate.valid?
  end
end
