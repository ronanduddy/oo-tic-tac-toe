require 'grid'

RSpec.describe Grid do
  let(:grid) { described_class.new(mock_stdout) }
  let(:mock_stdout) { StringIO.new }

  context '#render' do
    let(:grid_output) do
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

    it 'renders an empty grid' do
      grid.render
      expect(mock_stdout.string).to eq grid_output
    end
  end

  context '#prompt' do
    let(:prompt_output) do
      <<~STR
      Enter your move >
      STR
    end

    it 'renders an empty grid' do
      grid.prompt
      expect(mock_stdout.string).to eq prompt_output
    end
  end
end
