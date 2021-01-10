require 'coordinates'

RSpec.describe Coordinates do
  let(:coordinates) { described_class.new(input) }
  let(:input) { 'A1' }

  describe '#to_s' do
    it { expect(coordinates.to_s).to eq 'A1' }
  end

  describe '#valid?' do
    subject(:valid?) { coordinates.valid? }

    context 'when valid' do
      [
        'A1', 'A2', 'A3',
        'B1', 'B2', 'B3',
        'C1', 'C2', 'C3'
      ].each do |value|
        let(:input) { value }

        it { is_expected.to be true }
      end
    end

    context 'when invalid' do
      let(:input) { 'Z9' }

      it { is_expected.to be false }
    end
  end
end
