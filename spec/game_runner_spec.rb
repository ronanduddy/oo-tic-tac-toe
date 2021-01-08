RSpec.describe 'Runner' do
  let(:run) { `ruby tic_tac_toe/game_runner.rb` }
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
    STR
  end

  let(:mock_stdout) { StringIO.new }

  before do
    $stdout = mock_stdout
  end

  after { $stdout = STDOUT }

  it 'renders an empty grid' do
    expect(run).to eq grid
  end

  # specify { expect { run }.to output(grid).to_stdout }
end
