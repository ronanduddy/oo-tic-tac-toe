class Referee
  attr_reader :victor

  def initialize(grid)
    @board = grid.board
  end

  def winner?(player)
    @player = player
    return true if rows? || columns? || diagonals?

    false
  end

  private

  def rows?
    (0..2).any? { |i| row?(i) }
  end

  def columns?
    (0..2).any? { |i| column?(i) }
  end

  def diagonals?
    diagonal?([[0, 0], [1, 1], [2, 2]]) || diagonal?([[0, 2], [1, 1], [2, 0]])
  end

  def row?(index)
    player_won?(@board[index])
  end

  def column?(index)
    player_won?(@board.transpose[index])
  end

  def diagonal?(values)
    moves = values.map { |row, column| @board[row][column] }

    player_won?(moves)
  end

  def player_won?(moves)
    moves.all? { |move| move&.player == @player }
  end
end
