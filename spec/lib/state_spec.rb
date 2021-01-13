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
      allow(computer).to receive(:random_move).and_return(
        Move.new(computer, Coordinate.new('A1'))
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

  describe '#board' do
    before do
      allow(Grid).to receive(:new).and_return(
        instance_double(Grid, to_s: 'board')
      )
    end

    it { expect(state.board).to eq 'board' }
  end
end
