require_relative 'grid'
require_relative 'player'
require_relative 'move'
require_relative 'coordinate'

class State
  attr_reader :grid, :player, :computer, :current_move

  def initialize
    @grid = Grid.new
    @player = Player.new('X')
    @computer = Player.new('O')
    @game_over = false
  end

  def end_game
    @game_over = true
  end

  def playing?
    !@game_over
  end

  def random_move
    coordinate = Coordinate.random(@grid.availablities)
    @current_move = Move.new(@computer, coordinate)

    update
  end

  def player_move(value)
    coordinate = Coordinate.new(value)
    return false unless coordinate.valid?

    @current_move = Move.new(@player, coordinate)

    if @current_move.valid?(@grid.availablities)
      update
      return true
    end

    @current_move = nil

    return false
  end

  private

  def update
    @grid << @current_move
  end
end
