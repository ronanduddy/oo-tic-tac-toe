require 'shared_context/messenger'

RSpec.describe Messenger do
  include_context 'messenger'

  describe '#ask' do
    before { allow(mock_stdin).to receive(:gets).and_return('hello there') }

    it 'Returns message to stdin' do
      expect(mock_stdin).to receive(:gets)
      expect(messenger.ask('enter somthing:')).to eq 'hello there'
      expect(mock_stdout.string).to eq "enter somthing:\n"
    end
  end

  describe '#tell' do
    it 'Outputs message to stdout' do
      messenger.tell('hello world')
      expect(mock_stdout.string).to eq "hello world\n"
    end
  end
end
