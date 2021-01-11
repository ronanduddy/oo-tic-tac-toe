class Grid
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

  def initialize(messager)
    @messager = messager
    @coordinates = {}
  end

  def render
    @messager.tell(board_state)
  end

  def add(coordinate)
    @coordinates[coordinate.to_s.intern] = 'X'
  end

  private

  def board_state
    @coordinates.default = ' '
    sprintf(BOARD, @coordinates)
  end
end
