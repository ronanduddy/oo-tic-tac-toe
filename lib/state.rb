require_relative 'grid'

class State
  attr_reader :grid

  def initialize(messenger)
    @grid = Grid.new(messenger)
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def end_game
    @game_over = true
  end
end
