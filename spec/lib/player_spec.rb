require 'player'

RSpec.describe Player do
  let(:player) { described_class.new(marker) }
  let(:marker) { 'X' }

  describe '#random_move' do
    it { expect(player.random_move.valid?).to be true }
  end

  describe '#move' do
    it 'Sets coordinate and returns self' do
      expect(player.coordinate).to be nil
      expect(player.move('A1')).to eq player
      expect(player.coordinate.to_s).to eq 'A1'
    end
  end

  describe '#valid?' do
    it { expect(player.move('A1').valid?).to be true }
  end
end
