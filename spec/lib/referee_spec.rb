RSpec.describe Referee do
  let(:referee) { described_class.new(grid) }
  let(:grid) { Grid.new }
  let(:player) { Player.new('X') }

  describe '#winner?' do
    context 'when none' do
      it { expect(referee.winner?(player)).to be false }
    end

    context 'when A row' do
      before do
        grid << Move.new(player, Coordinate.new('A1'))
        grid << Move.new(player, Coordinate.new('A2'))
        grid << Move.new(player, Coordinate.new('A3'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when B row' do
      before do
        grid << Move.new(player, Coordinate.new('B1'))
        grid << Move.new(player, Coordinate.new('B2'))
        grid << Move.new(player, Coordinate.new('B3'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when C row' do
      before do
        grid << Move.new(player, Coordinate.new('C1'))
        grid << Move.new(player, Coordinate.new('C2'))
        grid << Move.new(player, Coordinate.new('C3'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when 1 column' do
      before do
        grid << Move.new(player, Coordinate.new('A1'))
        grid << Move.new(player, Coordinate.new('B1'))
        grid << Move.new(player, Coordinate.new('C1'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when 2 column' do
      before do
        grid << Move.new(player, Coordinate.new('A2'))
        grid << Move.new(player, Coordinate.new('B2'))
        grid << Move.new(player, Coordinate.new('C2'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when 3 column' do
      before do
        grid << Move.new(player, Coordinate.new('A3'))
        grid << Move.new(player, Coordinate.new('B3'))
        grid << Move.new(player, Coordinate.new('C3'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when first diagonal' do
      before do
        grid << Move.new(player, Coordinate.new('A1'))
        grid << Move.new(player, Coordinate.new('B2'))
        grid << Move.new(player, Coordinate.new('C3'))
      end

      it { expect(referee.winner?(player)).to be true }
    end

    context 'when second diagonal' do
      before do
        grid << Move.new(player, Coordinate.new('A3'))
        grid << Move.new(player, Coordinate.new('B2'))
        grid << Move.new(player, Coordinate.new('C1'))
      end

      it { expect(referee.winner?(player)).to be true }
    end
  end
end
