require 'coordinate'

RSpec.describe Coordinate do
  let(:coordinate) { described_class.new(input) }
  let(:input) { 'A1' }

  describe '.random' do
    let(:locations) { [:A1, :B2, :C3] }

    10.times do
      it 'produces either of the locations passed in' do
        result = described_class.random(locations).intern
        expect(locations).to include result
      end
    end
  end

  describe '#to_s' do
    it { expect(coordinate.to_s).to eq 'A1' }
  end

  describe '#intern' do
    it { expect(coordinate.intern).to eq :A1 }
  end

  describe '#valid?' do
    subject(:valid?) { coordinate.valid? }

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
