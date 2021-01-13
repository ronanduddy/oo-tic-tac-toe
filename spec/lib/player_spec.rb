RSpec.describe Player do
  let(:player) { described_class.new(mark) }
  let(:mark) { 'X' }

  describe '#to_s' do
    it { expect(player.to_s).to eq 'X' }
  end

  describe '#random_move' do
    before do
      allow(Coordinate).to receive(:random).and_return(Coordinate.new('A1'))
    end

    it { expect(player.random_move([:A1, :A2]).to_s).to eq 'X -> A1' }
  end

  describe '#move' do
    it { expect(player.move('A1').to_s).to eq 'X -> A1' }
  end
end
