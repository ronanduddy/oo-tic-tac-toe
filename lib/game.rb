require_relative 'messager'
require_relative 'state'
require_relative 'coordinate'

class Game
  def initialize(stdin, stdout)
    @messager = Messager.new(stdin, stdout)
    @state = State.new(@messager)
  end

  def run
    loop do
      @state.grid.render
      value = @messager.ask('Enter your move >')

      coordinate = Coordinate.new(value)

      if coordinate.valid?
        @state.grid.add(coordinate)
        @state.end_game
      else
        @messager.tell("#{coordinate} is invalid")
      end

      if @state.game_over?
        @state.grid.render
        @messager.tell("#{coordinate} - good move bye!")
        
        break
      end
    end
  end
end
