require 'player'

RSpec.describe Player do
  let(:player) { described_class.new(mark) }
  let(:mark) { 'X' }

  describe '#to_s' do
    it { expect(player.to_s).to eq 'X' }
  end
end
