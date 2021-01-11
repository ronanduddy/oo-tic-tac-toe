require 'grid'
require 'shared_context/messager'

RSpec.describe Grid do
  include_context 'messager'

  let(:grid) { described_class.new(messager) }

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
end
