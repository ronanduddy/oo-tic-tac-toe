require_relative 'grid'

class State
  attr_reader :grid

  def initialize(messager)
    @grid = Grid.new(messager)
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def end_game
    @game_over = true
  end
end
