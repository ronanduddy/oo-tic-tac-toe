require 'grid'
require 'shared_context/coordinate'

RSpec.describe Grid do
  let(:grid) { described_class.new }

  describe '#board' do
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

    it 'returns an empty grid' do
      expect(grid.to_s).to eq grid_output
    end
  end

  describe '#add' do
    include_context 'coordinate'

    let(:value) { 'B2' }
    let(:mark) { 'X' }

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
      grid.add(coordinate, mark)
      expect(grid.to_s).to eq grid_output
    end
  end
end
