RSpec.describe Game do
  let(:game) { described_class.new(stdin, stdout) }
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }

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

        Bye!
        STR
      end

      before do
        allow(stdin).to receive(:gets).and_return('A1')
        allow(Coordinate).to receive(:random).and_return(Coordinate.new('C3'))
      end

      it 'renders the grid, prompts user and exits' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end

    context 'when the user enter a bad coordinate' do
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
        allow(Coordinate).to receive(:random).and_return(Coordinate.new('C3'))
      end

      it 'renders the grid, prompts and quits upon a correct move' do
        expect(stdin).to receive(:gets)
        game.run
        expect(stdout.string).to eq grid
      end
    end
  end
end
