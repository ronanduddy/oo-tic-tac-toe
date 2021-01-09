require_relative 'grid'

class Game
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def run
    Grid.new(@stdout).render
  end
end
