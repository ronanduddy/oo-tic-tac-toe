require 'state'
require 'shared_context/messager'

RSpec.describe State do
  include_context 'messager'

  let(:state) { described_class.new(messager) }

  describe '#game_over?' do
    it { expect(state.game_over?).to be false }
  end

  describe '#end_game' do
    before { state.end_game }

    it { expect(state.game_over?).to be true }
  end
end
