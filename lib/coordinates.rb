class Coordinates
  attr_reader :row, :column

  def initialize(input)
    @row, @column = input.split('')
  end

  def to_s
    row + column
  end

  def valid?
    row.match?(/[A-C]/) && column.match?(/[1-3]/)
  end
end
