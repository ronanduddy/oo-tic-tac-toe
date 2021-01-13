require_relative 'grid'

class State
  attr_reader :current_move

  def initialize(player, computer)
    @player = player
    @computer = computer
    @grid = Grid.new
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

  def board
    @grid.to_s
  end

  private

  def update
    @grid << @current_move
  end
end
