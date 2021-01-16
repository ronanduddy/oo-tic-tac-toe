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
    game_loop
    print_board
    print_winner
  end

  private

  def game_loop
    while @state.playing do
      print_board
      player_move
      robot_move
    end
  end

  def print_board
    print("#{@state.board}")
  end

  def player_move
    loop do
      break if move_succeeded?

      print("Invalid move\n")
    end
  end

  def move_succeeded?
    if @state.player_move?(move)
      @state.update

      return true
    end

    false
  end

  def move
    @messenger.get('Enter your move > ')
  end

  def robot_move
    @state.random_move
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
