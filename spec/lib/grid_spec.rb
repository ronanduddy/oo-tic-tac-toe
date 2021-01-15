RSpec.describe Grid do
  let(:grid) { described_class.new }
  let(:move) { Move.new(Player.new('X'), Coordinate.new('B2')) }
  let(:player) { Player.new('X') }
  let(:computer) { Player.new('O') }

  describe '#to_s' do
    let(:output) do
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
    end

    let(:output_with_move) do
      <<~STR
        1  2  3
        __ __ __
    A  |  |  |  |
       |__|__|__|
    B  |  |X |  |
       |__|__|__|
    C  |  |  |  |
       |__|__|__|

      STR
    end

    it 'provides the string state of the grid' do
      expect(grid.to_s).to eq output
      grid << move
      expect(grid.to_s).to eq output_with_move
    end
  end
  
  describe '#<<' do
    it 'adds the move to the board and increments count' do
      expect(grid.count).to eq 0
      grid << move
      expect(grid.count).to eq 1
    end
  end

  describe '#availablities' do
    before do
      grid << Move.new(player, Coordinate.new('A1'))
      grid << Move.new(computer, Coordinate.new('A3'))
      grid << Move.new(player, Coordinate.new('B1'))
      grid << Move.new(computer, Coordinate.new('B3'))
      grid << Move.new(player, Coordinate.new('C1'))
    end

    it { expect(grid.availablities).to eq [:A2, :B2, :C2, :C3] }
  end
end
