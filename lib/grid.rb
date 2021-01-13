class Grid
  include Enumerable

  ROWS = *('A'..'C')
  COLUMNS = *(1..3)
  BOARD = <<~STR
              1  2  3
              __ __ __
          A  |%{A1} |%{A2} |%{A3} |
             |__|__|__|
          B  |%{B1} |%{B2} |%{B3} |
             |__|__|__|
          C  |%{C1} |%{C2} |%{C3} |
             |__|__|__|

            STR

  def initialize
    @moves = []
  end

  def to_s
    placed_moves = Hash.new(' ')
    each { |move| placed_moves.merge!(move.to_h) }

    sprintf(BOARD, placed_moves)
  end

  def each
    @moves.each do |move|
      yield move
    end
  end

  def <<(move)
    @moves << move
  end

  def availablities
    current_placement = map { |move| move.coordinate.intern }
    all_placements = ROWS.product(COLUMNS).map { |product| product.join.intern }

    all_placements - current_placement
  end
end
