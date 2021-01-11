require 'game'
require 'shared_context/stdlib'

RSpec.describe Game do
  include_context 'stdlib'

  let(:game) { described_class.new(mock_stdin, mock_stdout) }

  describe '#run' do
    context 'when the user enters good coordinates' do
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
        A1 - good move bye!
        STR
      end

      before { allow(mock_stdin).to receive(:gets).and_return('A1') }

      it 'renders the grid, prompts user and exits' do
        expect(mock_stdin).to receive(:gets)
        game.run
        expect(mock_stdout.string).to eq grid
      end
    end

    context 'when the user enters bad coordinates' do
      before { allow(mock_stdin).to receive(:gets).and_return('Z1', 'A1') }

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
        A1 - good move bye!
        STR
      end

      it 'renders the grid, prompts and quits upon a correct move' do
        expect(mock_stdin).to receive(:gets)
        game.run
        expect(mock_stdout.string).to eq grid
      end
    end
  end
end
