require_relative 'grid'

class State
  attr_reader :grid

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
    @grid.add(player.coordinate, player.mark)
  end
end
