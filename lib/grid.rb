class Grid
  def initialize(stdout)
    @stdout = stdout
  end

  def render
    grid =
            <<~STR
              1  2  3
              __ __ __
          A  |  |  |  |
             |__|__|__|
          B  |  |  |  |
             |__|__|__|
          C  |  |  |  |
             |__|__|__|
            STR

    @stdout.puts(grid)
  end

  def prompt
    @stdout.puts('Enter your move >')
  end
end
