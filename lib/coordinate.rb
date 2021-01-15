class Coordinate
  attr_reader :row, :column

  def initialize(input)
    @row, @column = input.split('')
  end

  def self.random(locations)
    self.new(locations.sample.to_s)
  end

  def to_s
    @row + @column
  end

  def intern
    to_s.intern
  end
end
