class Move
  attr_reader :player, :coordinate

  def initialize(player, coordinate)
    @player = player
    @coordinate = coordinate
  end

  def ==(other)    
    @player.to_s == other.player.to_s &&
    @coordinate.row == other.coordinate.row &&
    @coordinate.column == other.coordinate.column
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
