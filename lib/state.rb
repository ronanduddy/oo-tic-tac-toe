require_relative 'grid'
require_relative 'player'

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
    @current_move = @computer.random_move(@grid.availablities)
    update
  end

  def player_move(value)
    @current_move = @player.move(value)

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
