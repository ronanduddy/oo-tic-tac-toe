require 'game'

RSpec.describe Game do
  let(:mock_stdin) { StringIO.new }
  let(:mock_stdout) { StringIO.new }

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
    STR
  end

  context '#run' do
    subject(:run) { described_class.new(mock_stdin, mock_stdout).run }

    context 'when the user enters good coordinates' do
      it 'renders the grid, prompts user and exits' do
        run
        expect(mock_stdout.string).to eq grid
      end
    end

    # When the user enters bad coordinates,the application returns a
    # message about not understanding the message,then waits for good input.

    # The application doesn’t quit until the user enters good information.
    # Coordinates are a row letter combined with a column number,
    # for example: A2, B3.
  end
end
