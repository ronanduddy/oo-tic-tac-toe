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
      move = @messenger.get('Enter your move > ')

      if @state.player_move(move)
        @state.random_move
      else
        print("#{move} is invalid\n")
      end
    end

    print_board
    print_winner
  end

  private

  def print_board
    print("#{@state.board}")
  end

  def print_winner
    winner = @state.victor

    print("Nobody won...\n") if winner.nil?
    print("#{winner} won! :-)\n") if winner == @player
    print("#{winner} won! :-(\n") if winner == @computer
  end

  def print(message)
    @messenger.print(message)
  end
end
