class Move
  attr_reader :coordinate

  def initialize(player, coordinate)
    @player = player
    @coordinate = coordinate
  end

  def to_s
    "#{@player} -> #{@coordinate}"
  end

  def to_h
    { @coordinate.intern => @player.to_s }
  end

  def valid?(availablities)
    availablities.include? @coordinate.intern
  end
end
