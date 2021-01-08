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

  # specify { expect { run }.to output(grid).to_stdout }

  it 'renders an empty grid' do
    expect(run).to eq grid
  end
end
