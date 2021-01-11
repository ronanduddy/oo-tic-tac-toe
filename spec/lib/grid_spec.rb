require 'grid'
require 'shared_context/messenger'
require 'shared_context/coordinate'

RSpec.describe Grid do
  include_context 'messenger'

  let(:grid) { described_class.new(messenger) }

  describe '#render' do
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

  describe '#add' do
    include_context 'coordinate'

    let(:value) { 'B2' }

    let(:grid_output) do
      <<~STR
        1  2  3
        __ __ __
    A  |  |  |  |
       |__|__|__|
    B  |  |X |  |
       |__|__|__|
    C  |  |  |  |
       |__|__|__|

      STR
    end

    it 'adds coordinate to coordinates' do
      grid.add(coordinate)
      grid.render
      expect(mock_stdout.string).to eq grid_output
    end
  end
end
