require 'state'

RSpec.describe State do
  let(:state) { described_class.new }

  describe '#game_over?' do
    it { expect(state.game_over?).to be false }
  end

  describe '#end_game' do
    before { state.end_game }

    it { expect(state.game_over?).to be true }
  end
end
