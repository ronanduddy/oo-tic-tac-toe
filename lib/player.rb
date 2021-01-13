require_relative 'coordinate'

class Player
  attr_reader :mark, :coordinate

  def initialize(mark)
    @mark = mark
  end

  def random_move(locations)
    @coordinate = Coordinate.random(locations)
  end

  def move(value)
    @coordinate = Coordinate.new(value)

    self
  end

  def valid?
    @coordinate.valid?
  end

  def current_move
    { coordinate.intern => mark }
  end
end
