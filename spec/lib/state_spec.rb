RSpec.describe State do
  let(:state) { described_class.new(player, computer) }
  let(:player) { Player.new('X') }
  let(:computer) { Player.new('O') }

  describe '#end_game' do
    before { state.end_game }

    it { expect(state.playing?).to be false }
  end

  describe '#playing?' do
    it { expect(state.playing?).to be true }
  end

  describe '#random_move' do
    before do
      allow(Coordinate).to receive(:random).and_return(
        Coordinate.new('A1')
      )
    end

    before { state.random_move }

    it { expect(state.current_move.to_s).to eq 'O -> A1' }
  end

  describe '#player_move' do
    it 'updates state with new move if valid' do
      expect(state.player_move('X9')).to be false

      expect(state.player_move('A1')).to be true
      expect(state.current_move.to_s).to eq 'X -> A1'

      expect(state.player_move('A1')).to be false
      expect(state.current_move).to be nil
    end
  end
end
