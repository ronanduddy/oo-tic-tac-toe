require 'messager'

RSpec.describe Messager do
  let(:mock_stdout) { StringIO.new }

  it 'Outputs message to stdout' do
    described_class.new(mock_stdout).print('hello world')
    expect(mock_stdout.string).to eq "hello world\n"
  end
end
