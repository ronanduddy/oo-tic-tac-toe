RSpec.describe Game do
  let(:game) { described_class.new(stdin, stdout) }
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }
  let(:state) { State.new(player, computer) }
  let(:player) { Player.new('X') }
  let(:computer) { Player.new('O') }

  describe '#run' do
    context 'when the user enters a good coordinate' do
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

        Enter your move >
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        A1 - good move.
        Robot enters O -> C3!
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |O |
           |__|__|__|

        Enter your move >
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |  |  |O |
           |__|__|__|

        B1 - good move.
        Robot enters O -> C1!
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >
            1  2  3
            __ __ __
        A  |X |X |  |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        A2 - good move.
        Robot enters O -> A3!
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |  |  |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |  |X |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        B3 - good move.
        Robot enters O -> B2!
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |O |X |
           |__|__|__|
        C  |O |  |O |
           |__|__|__|

        Enter your move >
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |O |X |
           |__|__|__|
        C  |O |X |O |
           |__|__|__|

        C2 - good move.
            1  2  3
            __ __ __
        A  |X |X |O |
           |__|__|__|
        B  |X |O |X |
           |__|__|__|
        C  |O |X |O |
           |__|__|__|

        Bye!
        STR
      end

      let(:player_input) { ['A1', 'B1', 'A2', 'B3', 'C2'] }

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

    context 'when the users enter a bad coordinate' do
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

        Enter your move >
        Z1 is invalid
            1  2  3
            __ __ __
        A  |  |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        Enter your move >
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |  |
           |__|__|__|

        A1 - good move.
        Robot enters O -> C3!
            1  2  3
            __ __ __
        A  |X |  |  |
           |__|__|__|
        B  |  |  |  |
           |__|__|__|
        C  |  |  |O |
           |__|__|__|

        Bye!
        STR
      end

      before do
        allow(stdin).to receive(:gets).and_return('Z1', 'A1')
        allow(State).to receive(:new).and_return(state)
        allow(state).to receive(:playing).and_return(true, true, false)
        allow(computer).to receive(:random_move).and_return(
          Move.new(computer, Coordinate.new('C3')),
        )
      end

      it 'asks the user for a valid input' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end
  end
end
