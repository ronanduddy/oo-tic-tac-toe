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

  describe '#player_move?' do
    it 'sets current_move and checks if it is valid' do
      expect(state.current_move).to be nil
      expect(state.player_move?('A1')).to be true
      expect(state.current_move).to eq Move.new(player, Coordinate.new('A1'))
    end
  end

  describe '#update' do
    context 'when grid is full' do
      let(:grid) { Grid.new }

      before do
        allow(grid).to receive(:full?).and_return(true)
        allow(Grid).to receive(:new).and_return(grid)
      end

      it 'ends the game and does not add move to the board' do
        expect(state.playing).to be true
        expect(state.victor).to be nil
        expect(grid).to_not receive(:<<)

        state.update

        expect(state.playing).to be false
        expect(state.victor).to be nil
      end
    end

    context 'keeps the game running and adds moves to the board' do
      let(:grid) { Grid.new }

      before do
        allow(Grid).to receive(:new).and_return(grid)
      end

      it 'ends the game' do
        expect(state.playing).to be true
        expect(state.victor).to be nil
        expect(grid).to receive(:<<)

        state.update

        expect(state.playing).to be true
        expect(state.victor).to be nil
      end
    end

    context 'when there is a winner' do
      let(:referee) { Referee.new(Grid.new) }

      before do
        allow(referee).to receive(:winner?).with(computer).and_return(false)
        allow(referee).to receive(:winner?).with(player).and_return(true)
        allow(Referee).to receive(:new).and_return(referee)

        state.player_move?('A3')
      end

      it 'send the game and sets the victor' do
        expect(state.playing).to be true
        expect(state.victor).to be nil

        state.update

        expect(state.playing).to be false
        expect(state.victor).to be player
      end
    end
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
