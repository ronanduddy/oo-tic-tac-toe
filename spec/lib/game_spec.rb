RSpec.describe Game do
  let(:game) { described_class.new(stdin, stdout) }
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }
  let(:state) { State.new(player, computer) }
  let(:player) { Player.new('X') }
  let(:computer) { Player.new('O') }

  describe '#run' do
    context 'when O wins' do
      let(:grid) do
        <<~STR
            1  2  3
            __ __ __
        A  |  |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
        Invalid move
        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |O |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |O |X |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        O won! :-(
        STR
      end

      let(:player_input) { ['Z1', 'A1', 'B1', 'A2', 'B3'] }

      before do
        allow(stdin).to receive(:gets).and_return(*player_input)
        allow(State).to receive(:new).and_return(state)
        allow(computer).to receive(:random_move).and_return(
          Move.new(computer, Coordinate.new('C3')),
          Move.new(computer, Coordinate.new('C1')),
          Move.new(computer, Coordinate.new('A3')),
          Move.new(computer, Coordinate.new('B2'))
        )
      end

      it 'renders the grid, prompts user and exits' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end

    context 'when X wins' do
      let(:grid) do
        <<~STR
            1  2  3
            __ __ __
        A  |  |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |O |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |X |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |X |X |X |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        X won! :-)
        STR
      end

      let(:player_input) { ['A1', 'A2', 'A3'] }

      before do
        allow(stdin).to receive(:gets).and_return(*player_input)
        allow(State).to receive(:new).and_return(state)
        allow(computer).to receive(:random_move).and_return(
          Move.new(computer, Coordinate.new('C3')),
          Move.new(computer, Coordinate.new('C1'))
        )
      end

      it 'renders the grid, prompts user and exits' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end

    context 'when nobody wins' do
      let(:grid) do
        <<~STR
            1  2  3
            __ __ __
        A  |  |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |O |X |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |O |X |O |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |O |X |O |
           |__|__|__|
        B  |X |X |O |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |O |X |O |
           |__|__|__|
        B  |X |X |O |
           |__|__|__|
        C  |X |O |  |
           |__|__|__|

        Enter your move >\s
            1  2  3
            __ __ __
        A  |O |X |O |
           |__|__|__|
        B  |X |X |O |
           |__|__|__|
        C  |X |O |X |
           |__|__|__|

        Nobody won...
        STR
      end

      let(:player_input) { ['A2', 'B1', 'B2', 'C1', 'C3'] }

      before do
        allow(stdin).to receive(:gets).and_return(*player_input)
        allow(State).to receive(:new).and_return(state)
        allow(computer).to receive(:random_move).and_return(
          Move.new(computer, Coordinate.new('A1')),
          Move.new(computer, Coordinate.new('A3')),
          Move.new(computer, Coordinate.new('B3')),
          Move.new(computer, Coordinate.new('C2'))
        )
      end

      it 'renders the grid, prompts user and exits' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end
  end
end
