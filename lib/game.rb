require_relative 'messenger'
require_relative 'state'
require_relative 'player'

class Game
  def initialize(stdin, stdout)
    @messenger = Messenger.new(stdin, stdout)
    @state = State.new
    @player = Player.new('X')
    @computer = Player.new('O')
  end

  def run
    while @state.playing? do
      print_board
      move = @messenger.ask('Enter your move >')

      if @player.move(move).valid?
        @state.update(@player)
        print_board
        print("#{move} - good move.")

        @computer.random_move
        @state.update(@computer)
        print("Robot enters #{@computer.coordinate}!")

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
    print(@state.board)
  end

  def print(message)
    @messenger.tell(message)
  end
end
