require 'shared_context/messager'

RSpec.describe Messager do
  include_context 'messager'

  describe '#ask' do
    before { allow(mock_stdin).to receive(:gets).and_return('hello there') }

    it 'Returns message to stdin' do
      expect(mock_stdin).to receive(:gets)
      expect(messager.ask('enter somthing:')).to eq 'hello there'
      expect(mock_stdout.string).to eq "enter somthing:\n"
    end
  end

  describe '#tell' do
    it 'Outputs message to stdout' do
      messager.tell('hello world')
      expect(mock_stdout.string).to eq "hello world\n"
    end
  end
end
