require_relative 'grid'

class Game
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def run
    game_over = false
    grid = Grid.new(@stdout)
    coordinates = ''

    loop do
      grid.render
      grid.prompt
      coordinates = @stdin.gets

      if valid?(coordinates)
        game_over = true
      else
        @stdout.puts("#{coordinates} is invalid")
      end

      break if game_over
    end

    @stdout.puts("#{coordinates} - good move bye!")
  end

  private

  def valid?(coordinates)
    alpha, digit = coordinates.split('')

    alpha.match?(/[A-C]/) && digit.match?(/[1-3]/)
  end
end
