RSpec.describe 'Runner' do
  let(:run) { `ruby tic_tac_toe/game_runner.rb` }
  let(:grid) do
    <<~STR
     __ __ __
    |  |  |  |
    |__|__|__|
    |  |  |  |
    |__|__|__|
    |  |  |  |
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
