require 'player'

RSpec.describe Player do
  let(:player) { described_class.new(marker) }
  let(:marker) { 'X' }

  describe '#random_move' do
    let(:coordinate) { instance_double(Coordinate, to_s: 'A1') }

    before do
      allow(Coordinate).to receive(:random).and_return(coordinate)
    end

    it 'returns a coordinate based on one of the locations' do
      expect(Coordinate).to receive(:random).with([:A1, :A2])
      expect(player.random_move([:A1, :A2]).to_s).to eq 'A1'
    end
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

  describe '#current_move' do
    before { player.move('A1') }

    it { expect(player.current_move).to eq({ A1: 'X' }) }
  end
end
