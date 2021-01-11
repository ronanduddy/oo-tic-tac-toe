class Coordinate
  def initialize(input)
    @row, @column = input.split('')
  end

  def self.random
    row = %w(A B C)[rand(3)]
    column = rand(1..3)
    self.new(row + column.to_s)
  end

  def to_s
    @row + @column
  end

  def valid?
    @row.match?(/[A-C]/) && @column.match?(/[1-3]/)
  end
end
