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

  def update(player)
    @grid.add(player.current_move)
  end

  def free_locations
    @grid.coordinates.select { |_, coordinate| coordinate.nil? }.keys
  end
end
