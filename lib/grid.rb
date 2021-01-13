class Grid
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

  attr_reader :coordinates

  def initialize
    @coordinates = blank_board
  end

  def to_s
    sprintf(BOARD, placed_moves)
  end

  def add(move)
    @coordinates.merge!(move)
  end

  private

  def blank_board
    result = {}
    ROWS.product(COLUMNS).each do |product|
      result[product.join.intern] = nil
    end

    result
  end

  def placed_moves
    Hash.new(' ').merge(@coordinates.compact)
  end
end
