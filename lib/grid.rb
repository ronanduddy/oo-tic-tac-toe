class Grid
  BOARD = <<~STR
              1  2  3
              __ __ __
          A  |%s |%s |%s |
             |__|__|__|
          B  |%s |%s |%s |
             |__|__|__|
          C  |%s |%s |%s |
             |__|__|__|

            STR

  attr_reader :count

  def initialize
    @board = Array.new(3) { Array.new(3) }
    @count = 0
  end

  def to_s
    placements = @board.flatten.map do |move|
      move.nil? ? ' ' : move.player.to_s
    end

    sprintf(BOARD, *placements)
  end

  def <<(move)
    row = move.coordinate.row_index
    column = move.coordinate.column_index

    @board[row][column] = move
    @count += 1
  end

  def availablities
    all_placements - current_placements
  end

  private

  def all_placements
    [*'A'..'C'].product([*1..3]).map { |product| product.join.intern }
  end

  def current_placements
    @board.flatten.compact.map { |move| move.coordinate.intern }
  end
end
