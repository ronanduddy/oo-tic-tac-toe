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
    while @state.playing? do
      print_board
      move = @messenger.get('Enter your move >')

      if @state.player_move(move)
        print_board
        print("#{move} - good move.")

        @state.random_move
        print("Robot enters #{@state.current_move}!")

        @state.end_game
      else
        print("#{move} is invalid")
      end
    end

    print_board
    print("Bye!")
  end

  private

  def print_board
    print(@state.grid)
  end

  def print(message)
    @messenger.print(message)
  end
end
