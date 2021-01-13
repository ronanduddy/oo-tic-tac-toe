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

    let(:expected_coordinates) do
      { B1: 'X', B2: 'X', B3: 'X', C1: 'O', C2: 'O' }
    end

    before do
      grid.add({ B2: 'X' })
      grid.add({ C2: 'O' })
      grid.add({ B1: 'X' })
      grid.add({ C1: 'O' })
      grid.add({ B3: 'X' })
    end

    it 'adds piece to grid' do
      expect(grid.coordinates.compact).to eq expected_coordinates
    end
  end
end
