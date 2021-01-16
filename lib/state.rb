require_relative 'grid'
require_relative 'referee'

class State
  attr_reader :playing, :current_move, :victor

  def initialize(player, computer)
    @player = player
    @computer = computer
    @grid = Grid.new
    @referee = Referee.new(@grid)
    @playing = true
  end

  def random_move 
    @current_move = @computer.random_move(@grid.availablities)
  end

  def player_move(value)
    @current_move = @player.move(value)
  end

  def valid_move?
    @current_move.valid?(@grid.availablities)
  end

  def update
    @grid.full? ? end_game : update_grid
    end_game if winner
  end

  def board
    @grid.to_s
  end

  private

  def update_grid
    @grid << @current_move
  end

  def winner
    @victor = @player if @referee.winner?(@player)
    @victor = @computer if @referee.winner?(@computer)

    @victor
  end

  def end_game
    @playing = false
  end
end
