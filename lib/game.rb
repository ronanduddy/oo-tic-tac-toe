require_relative 'grid'
require_relative 'coordinate'
require_relative 'messager'

class Game
  def initialize(stdin, stdout)
    @messager = Messager.new(stdin, stdout)
    @grid = Grid.new(@messager)
  end

  def run
    game_over = false
    coordinate = nil

    loop do
      @grid.render

      input = @messager.ask('Enter your move >')
      coordinate = Coordinate.new(input)

      if coordinate.valid?
        game_over = true
      else
        @messager.tell("#{coordinate} is invalid")
      end

      break if game_over
    end

    @messager.tell("#{coordinate} - good move bye!")
  end
end
