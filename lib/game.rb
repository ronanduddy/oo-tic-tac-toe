require_relative 'messenger'
require_relative 'state'
require_relative 'coordinate'

class Game
  def initialize(stdin, stdout)
    @messenger = Messenger.new(stdin, stdout)
    @state = State.new
  end

  def run
    loop do
      @messenger.tell(@state.grid.to_s)
      value = @messenger.ask('Enter your move >')

      coordinate = Coordinate.new(value)

      if coordinate.valid?
        @state.grid.add(coordinate)
        @state.end_game
      else
        @messenger.tell("#{coordinate} is invalid")
      end

      if @state.game_over?
        @messenger.tell(@state.grid.to_s)
        @messenger.tell("#{coordinate} - good move bye!")

        break
      end
    end
  end
end
