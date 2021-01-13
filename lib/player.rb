require_relative 'coordinate'
require_relative 'move'

class Player
  def initialize(mark)
    @mark = mark
  end

  def to_s
    @mark
  end

  def random_move(availablities)
    Move.new(self, Coordinate.random(availablities))
  end

  def move(value)
    Move.new(self, Coordinate.new(value))
  end
end
