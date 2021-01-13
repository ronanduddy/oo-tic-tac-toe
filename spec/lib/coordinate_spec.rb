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
end
