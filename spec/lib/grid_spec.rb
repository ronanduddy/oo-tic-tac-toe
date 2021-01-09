require 'grid'

RSpec.describe Grid do
  let(:mock_stdout) { StringIO.new }

  context '#render' do
    subject(:render) { described_class.new(mock_stdout).render }

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

    it 'renders an empty grid' do
      render
      expect(mock_stdout.string).to eq grid
    end
  end
end
