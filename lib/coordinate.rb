class Coordinate
  ROW_MAP = { 'A' => 0, 'B' => 1, 'C' => 2 }
  COLUMN_MAP = { '1' => 0, '2' => 1, '3' => 2 }

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

  def row_index
    ROW_MAP[@row]
  end

  def column_index
    COLUMN_MAP[@column]
  end
end
