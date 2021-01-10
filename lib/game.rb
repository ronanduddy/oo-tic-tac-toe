require_relative 'grid'
require_relative 'coordinates'

class Game
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout

    @grid = Grid.new(@stdout)
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
        @stdout.puts("#{coordinates} is invalid")
      end

      break if game_over
    end

    @stdout.puts("#{coordinates} - good move bye!")
  end
end
