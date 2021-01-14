RSpec.describe Move do
  let(:move) { described_class.new(player, coordinate) }
  let(:player) { Player.new('X') }
  let(:coordinate) { Coordinate.new('A1') }

  describe '#==' do
    it 'checks the equality of another move' do
      same_move = described_class.new(Player.new('X'), Coordinate.new('A1'))
      expect(move == same_move).to be true

      different_move = described_class.new(Player.new('O'), Coordinate.new('A1'))
      expect(move == different_move).to be false
    end
  end

  describe '#to_s' do
    it { expect(move.to_s).to eq 'X -> A1' }
  end

  describe '#to_h' do
    it { expect(move.to_h).to eq({ A1: 'X'}) }
  end

  describe '#valid?' do
    it 'checks if move within set of available coordinates' do
      expect(move.valid?([:A1, :B2])).to be true
      expect(move.valid?([:A2, :C3])).to be false
    end
  end
end
