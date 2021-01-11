require_relative 'grid'
require_relative 'coordinates'
require_relative 'messager'

class Game
  def initialize(stdin, stdout)
    @stdin = stdin
    @messager = Messager.new(stdout)

    @grid = Grid.new(@messager)
  end

  def run
    game_over = false
    coordinates = nil

    loop do
      @grid.render
      @grid.prompt
      coordinates = Coordinates.new(@stdin.gets)

      if coordinates.valid?
        game_over = true
      else
        @messager.print("#{coordinates} is invalid")
      end

      break if game_over
    end

    @messager.print("#{coordinates} - good move bye!")
  end
end
