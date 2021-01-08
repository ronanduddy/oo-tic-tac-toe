require './tic_tac_toe/grid'

RSpec.describe Grid do
  let(:mock_stdout) { StringIO.new }

  context '#render' do
    subject(:render) { described_class.new(mock_stdout).render }

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

    it 'renders an empty grid' do
      render
      expect(mock_stdout.string).to eq grid
    end
  end
end
