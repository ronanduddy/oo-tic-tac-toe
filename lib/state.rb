require_relative 'grid'

class State
  def initialize
    @grid = Grid.new
    @game_over = false
  end

  def end_game
    @game_over = true
  end

  def playing?
    !@game_over
  end

  def board
    @grid.to_s
  end

  def update(player)
    @grid.add(player.current_move)
  end
end
