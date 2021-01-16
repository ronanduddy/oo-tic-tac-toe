require_relative 'messenger'
require_relative 'player'
require_relative 'state'

class Game
  def initialize(stdin, stdout)
    @messenger = Messenger.new(stdin, stdout)
    @player = Player.new('X')
    @computer = Player.new('O')
    @state = State.new(@player, @computer)
  end

  def run
    while @state.playing do
      print_board
      move = @messenger.get('Enter your move >')

      if @state.player_move(move)
        print_board
        print("#{move} - good move.")
        print("Robot enters #{@state.current_move}!") if @state.random_move
      else
        print("#{move} is invalid")
      end
    end

    print_board
    print_winner
  end

  private

  def print_board
    print(@state.board)
  end

  def print_winner
    winner = @state.victor

    print('Nobody won...') if winner.nil?
    print("#{winner} won! :-)") if winner == @player
    print("#{winner} won! :-(") if winner == @computer
  end

  def print(message)
    @messenger.print(message)
  end
end
