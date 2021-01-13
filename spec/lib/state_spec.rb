require 'state'
require 'player'

RSpec.describe State do
  let(:state) { described_class.new }

  describe '#end_game' do
    before { state.end_game }

    it { expect(state.playing?).to be false }
  end

  describe '#playing?' do
    it { expect(state.playing?).to be true }
  end

  describe '#update' do
    let(:player) { instance_double(Player, current_move: { A1: 'X' }) }

    before do
      allow(Grid).to receive(:new).and_return(
        instance_double(Grid, add: true)
      )
    end

    it { expect(state.update(player)).to be true }
  end

  describe '#free_locations' do
    before do
      allow(Grid).to receive(:new).and_return(
        instance_double(Grid, coordinates: {A1: nil, A2: 'X', A3: 'O'})
      )
    end

    it { expect(state.free_locations).to eq [:A1] }
  end
end
