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
    context 'when valid' do
      it { expect(coordinate.to_s).to eq 'A1' }
    end

    context 'when invalid' do
      let(:input) { 'x' }
      
      it { expect(coordinate.to_s).to eq 'x' }
    end
  end

  describe '#intern' do
    it { expect(coordinate.intern).to eq :A1 }
  end

  describe '#row_index' do
    it { expect(coordinate.row_index).to eq 0 }
  end

  describe '#column_index' do
    it { expect(coordinate.column_index).to eq 0 }
  end
end
