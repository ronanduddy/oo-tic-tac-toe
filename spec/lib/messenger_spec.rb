RSpec.describe Messenger do
  let(:messenger) { described_class.new(stdin, stdout) }
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }

  describe '#ask' do
    before { allow(stdin).to receive(:gets).and_return('hello there') }

    it 'Returns message to stdin' do
      expect(stdin).to receive(:gets)
      expect(messenger.ask('enter somthing:')).to eq 'hello there'
      expect(stdout.string).to eq "enter somthing:\n"
    end
  end

  describe '#tell' do
    it 'Outputs message to stdout' do
      messenger.tell('hello world')
      expect(stdout.string).to eq "hello world\n"
    end
  end
end
