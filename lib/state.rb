require_relative 'grid'

class State
  attr_reader :playing, :current_move

  def initialize(player, computer)
    @player = player
    @computer = computer
    @grid = Grid.new
    @playing = true
  end

  def random_move
    @current_move = @computer.random_move(@grid.availablities)

    update
  end

  def player_move(value)
    @current_move = @player.move(value)
    return update if @current_move.valid?(@grid.availablities)

    @current_move = nil

    false
  end

  def board
    @grid.to_s
  end

  private

  def update
    if @grid.availablities.empty?
      @playing = false

      return false
    end

    @grid << @current_move

    true
  end
end
