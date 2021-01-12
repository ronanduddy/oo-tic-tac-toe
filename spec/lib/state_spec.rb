require 'state'

RSpec.describe State do
  let(:state) { described_class.new }

  describe '#end_game' do
    before { state.end_game }

    it { expect(state.playing?).to be false }
  end

  describe '#playing?' do
    it { expect(state.playing?).to be true }
  end

  describe '#board' do
    before do
      allow(Grid).to receive(:new).and_return(
        instance_double(Grid, to_s: 'board state')
      )
    end

    it { expect(state.board).to eq 'board state' }
  end
end
