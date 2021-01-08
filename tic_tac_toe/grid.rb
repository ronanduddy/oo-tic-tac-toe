class Grid
  def initialize(stdout)
    @stdout = stdout
  end

  def render
    grid =
            <<~STR
             __ __ __
            |  |  |  |
            |__|__|__|
            |  |  |  |
            |__|__|__|
            |  |  |  |
            |__|__|__|
            STR
    @stdout.puts(grid)
  end
end
