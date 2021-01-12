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

  def initialize
    @coordinates = {}
  end

  def to_s
    @coordinates.default = ' '
    
    sprintf(BOARD, @coordinates)
  end

  def add(move)
    unless @coordinates.key? move.keys.first
      @coordinates.merge!(move)
      return true
    end

    false
  end
end
