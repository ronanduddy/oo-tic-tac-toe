require_relative 'grid'
require_relative 'coordinates'
require_relative 'messager'

class Game
  def initialize(stdin, stdout)
    @messager = Messager.new(stdin, stdout)
    @grid = Grid.new(@messager)
  end

  def run
    game_over = false
    coordinates = nil

    loop do
      @grid.render

      input = @messager.ask('Enter your move >')
      coordinates = Coordinates.new(input)

      if coordinates.valid?
        game_over = true
      else
        @messager.tell("#{coordinates} is invalid")
      end

      break if game_over
    end

    @messager.tell("#{coordinates} - good move bye!")
  end
end
