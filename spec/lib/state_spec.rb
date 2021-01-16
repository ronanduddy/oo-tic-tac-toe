RSpec.describe State do
  let(:state) { described_class.new(player, computer) }
  let(:player) { Player.new('X') }
  let(:computer) { Player.new('O') }

  describe '#random_move' do
    before do
      allow(computer).to receive(:random_move).and_return(
        Move.new(computer, Coordinate.new('A1'))
      )
    end

    it 'sets current_move' do
      expect(state.current_move).to be nil
      state.random_move
      expect(state.current_move).to eq Move.new(computer, Coordinate.new('A1'))
    end
  end

  describe '#player_move' do
    it 'sets current_move' do
      expect(state.current_move).to be nil
      state.player_move('A1')
      expect(state.current_move).to eq Move.new(player, Coordinate.new('A1'))
    end
  end

  describe '#valid_move?' do
    before { state.player_move('A1') }

    it { expect(state.valid_move?).to be true }
  end

  describe '#board' do
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

    it { expect(state.board).to eq output }
  end
end
