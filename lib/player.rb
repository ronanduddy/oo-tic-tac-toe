require_relative 'coordinate'

class Player
  attr_reader :mark, :coordinate

  def initialize(mark)
    @mark = mark
  end

  def random_move
    @coordinate = Coordinate.random
  end

  def move(value)
    @coordinate = Coordinate.new(value)

    self
  end

  def valid?
    @coordinate.valid?
  end
end
