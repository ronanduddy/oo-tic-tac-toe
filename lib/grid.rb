class Grid
  def initialize(messager)
    @messager = messager
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

    @messager.tell(grid)
  end
end
