require_relative 'messenger'
require_relative 'state'
require_relative 'coordinate'

class Game
  def initialize(stdin, stdout)
    @messenger = Messenger.new(stdin, stdout)
    @state = State.new
  end

  def run
    while @state.playing? do
      @messenger.tell(@state.grid.to_s)
      value = @messenger.ask('Enter your move >')

      coordinate = Coordinate.new(value)

      if coordinate.valid?
        @state.grid.add(coordinate, 'X')
        @messenger.tell(@state.grid.to_s)
        @messenger.tell("#{coordinate} - good move.")

        random_coordinate = Coordinate.random
        @state.grid.add(random_coordinate, 'O')
        @messenger.tell("Robot enters #{random_coordinate}!")

        @state.end_game
      else
        @messenger.tell("#{coordinate} is invalid")
      end
    end

    @messenger.tell(@state.grid.to_s)
    @messenger.tell("Bye!")
  end
end
